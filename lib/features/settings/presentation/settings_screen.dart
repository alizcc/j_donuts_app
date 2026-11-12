import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/router/auth_status.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/features/auth/data/auth_providers.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  static const double _spinnerSize = 20;
  static const double _spinnerStroke = 2;

  bool _isLoggingOut = false;

  Future<void> _logOut() async {
    if (_isLoggingOut) return;
    setState(() => _isLoggingOut = true);
    final result = await ref.read(authRepositoryProvider).logout();
    if (!mounted) return;
    if (result is Err) {
      setState(() => _isLoggingOut = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.genericError)));
      return;
    }
    ref
        .read(authStatusControllerProvider.notifier)
        .update(AuthStatus.unauthenticated);
    context.go(AppRoutes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.navSettings)),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.error),
            title: Text(
              l10n.logOut,
              style: AppTypography.body.copyWith(color: AppColors.error),
            ),
            trailing: _isLoggingOut
                ? const SizedBox.square(
                    dimension: _spinnerSize,
                    child: CircularProgressIndicator(
                      strokeWidth: _spinnerStroke,
                    ),
                  )
                : null,
            onTap: _logOut,
          ),
        ],
      ),
    );
  }
}
