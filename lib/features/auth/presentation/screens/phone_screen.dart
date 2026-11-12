import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/features/auth/domain/validators/phone_validator.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_controller.dart';
import 'package:j_donuts_app/features/auth/presentation/widgets/auth_step_scaffold.dart';

class PhoneScreen extends ConsumerStatefulWidget {
  const PhoneScreen({super.key});

  @override
  ConsumerState<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends ConsumerState<PhoneScreen> {
  static const int _maxInputLength = 15;

  late final TextEditingController _controller = TextEditingController(
    text: ref.read(authFlowControllerProvider).phoneInput,
  );

  bool _touched = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    FocusScope.of(context).unfocus();
    final next = await ref
        .read(authFlowControllerProvider.notifier)
        .submitPhone();
    if (next != null && mounted) await context.push(next);
  }

  void _switchToRegister() {
    ref.read(authFlowControllerProvider.notifier).switchToRegister();
    context.pushReplacement(AppRoutes.registerPhone);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = ref.watch(authFlowControllerProvider);
    return AuthStepScaffold(
      step: 1,
      title: l10n.phoneTitle,
      isLoading: state.isLoading,
      onContinue: state.normalizedPhone == null ? null : _continue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              if (!hasFocus) setState(() => _touched = true);
            },
            child: TextField(
              controller: _controller,
              autofocus: true,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9 \-]')),
                LengthLimitingTextInputFormatter(_maxInputLength),
              ],
              onChanged: ref.read(authFlowControllerProvider.notifier).setPhone,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: AppSpacing.lg,
                    right: AppSpacing.sm,
                  ),
                  child: Text(
                    myanmarCountryCode,
                    style: AppTypography.body.copyWith(
                      color: AppColors.inkMuted,
                    ),
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(),
                hintText: l10n.phoneHint,
                errorText: _touched ? _errorText(state.phoneInput) : null,
              ),
            ),
          ),
          if (state.phoneNotRegistered) _buildNotRegistered(context),
          if (state.hasError) _buildGenericError(context),
        ],
      ),
    );
  }

  String? _errorText(String input) {
    final l10n = context.l10n;
    return switch (validatePhone(input)) {
      PhoneError.empty => l10n.phoneErrorEmpty,
      PhoneError.invalid => l10n.phoneErrorInvalid,
      null => null,
    };
  }

  Widget _buildNotRegistered(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            l10n.phoneNotRegistered,
            style: AppTypography.bodySmall.copyWith(color: AppColors.error),
          ),
          TextButton(
            onPressed: _switchToRegister,
            child: Text(l10n.registerLink),
          ),
        ],
      ),
    );
  }

  Widget _buildGenericError(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Text(
        context.l10n.genericError,
        style: AppTypography.bodySmall.copyWith(color: AppColors.error),
      ),
    );
  }
}
