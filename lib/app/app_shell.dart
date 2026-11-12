import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/app/bottom_nav_bar.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/network/network_providers.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/widgets/offline_banner.dart';

class AppShell extends ConsumerWidget {
  const AppShell({required this.shell, super.key});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isOffline = ref.watch(isOnlineProvider).value == false;
    return Scaffold(
      backgroundColor: AppColors.greySurface,
      body: shell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OfflineBanner(isOffline: isOffline),
          BottomNavBar(
            currentIndex: shell.currentIndex,
            onSelected: _goToBranch,
            items: [
              (icon: Icons.home_outlined, label: l10n.navHome),
              (icon: Icons.workspace_premium_outlined, label: l10n.navReward),
              (icon: Icons.qr_code_scanner, label: l10n.navScan),
              (
                icon: Icons.account_balance_wallet_outlined,
                label: l10n.navWallet,
              ),
              (icon: Icons.settings_outlined, label: l10n.navSettings),
            ],
          ),
        ],
      ),
    );
  }

  void _goToBranch(int index) =>
      shell.goBranch(index, initialLocation: index == shell.currentIndex);
}
