import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/features/auth/domain/validators/otp_validator.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_controller.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/otp_controller.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/otp_state.dart';
import 'package:j_donuts_app/features/auth/presentation/widgets/auth_step_scaffold.dart';
import 'package:j_donuts_app/features/auth/presentation/widgets/shake.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  static const double _boxWidth = 44;
  static const double _boxHeight = 56;
  static const double _borderWidth = 1.5;
  static const int _secondsPerMinute = 60;

  final TextEditingController _pinController = TextEditingController();

  int _shakeCount = 0;

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _verify(String code) async {
    final isCorrect = await ref
        .read(otpControllerProvider.notifier)
        .verify(code);
    if (!mounted) return;
    if (!isCorrect) {
      _pinController.clear();
      setState(() => _shakeCount++);
      return;
    }
    final next = await ref
        .read(authFlowControllerProvider.notifier)
        .continueAfterOtp();
    if (next == null || !mounted) return;
    if (next == AppRoutes.registerName) {
      context.pushReplacement(next);
    } else {
      // Returning users are signed in now, so drop the sign-in screens.
      context.go(next);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final otp = ref.watch(otpControllerProvider);
    final flow = ref.watch(authFlowControllerProvider);
    final isBusy = otp.isVerifying || flow.isLoading;
    final screen = AuthStepScaffold(
      step: 2,
      title: l10n.otpTitle,
      subtitle: l10n.otpSentTo(flow.normalizedPhone ?? ''),
      showContinue: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shake(
            trigger: _shakeCount,
            child: Pinput(
              length: otpLength,
              controller: _pinController,
              autofocus: true,
              enabled: !otp.isLocked && !isBusy,
              forceErrorState: _errorText(otp) != null,
              errorText: _errorText(otp),
              errorTextStyle: AppTypography.bodySmall.copyWith(
                color: AppColors.error,
              ),
              defaultPinTheme: _pinTheme(AppColors.transparent),
              focusedPinTheme: _pinTheme(AppColors.cyan),
              errorPinTheme: _pinTheme(AppColors.error),
              onCompleted: _verify,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          _buildResend(otp),
        ],
      ),
    );
    return Stack(
      children: [
        screen,
        if (isBusy)
          const Positioned.fill(
            child: ColoredBox(
              color: AppColors.scrim,
              child: Center(
                child: CircularProgressIndicator(color: AppColors.pink),
              ),
            ),
          ),
      ],
    );
  }

  String? _errorText(OtpState otp) {
    final l10n = context.l10n;
    if (otp.hasError) return l10n.genericError;
    if (otp.isLocked) return l10n.otpLocked;
    if (otp.wrongAttempts > 0) {
      return l10n.otpWrongCode(OtpState.maxWrongAttempts - otp.wrongAttempts);
    }
    return null;
  }

  PinTheme _pinTheme(Color borderColor) {
    return PinTheme(
      width: _boxWidth,
      height: _boxHeight,
      textStyle: AppTypography.title,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadii.sm),
        border: Border.all(color: borderColor, width: _borderWidth),
      ),
    );
  }

  Widget _buildResend(OtpState otp) {
    final l10n = context.l10n;
    if (otp.canResend) {
      return Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () async {
            _pinController.clear();
            await ref.read(otpControllerProvider.notifier).resend();
          },
          child: Text(l10n.otpResend),
        ),
      );
    }
    final minutes = otp.secondsLeft ~/ _secondsPerMinute;
    final seconds = otp.secondsLeft % _secondsPerMinute;
    final time = '$minutes:${seconds.toString().padLeft(2, '0')}';
    return Text.rich(
      TextSpan(
        style: AppTypography.bodySmall,
        children: [
          TextSpan(text: '${l10n.otpDidntReceive}\n${l10n.otpResendIn} '),
          TextSpan(
            text: time,
            style: const TextStyle(color: AppColors.pink),
          ),
          TextSpan(text: ' ${l10n.otpMinutes}'),
        ],
      ),
    );
  }
}
