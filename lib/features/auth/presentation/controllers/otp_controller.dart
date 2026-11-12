import 'dart:async';

import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/features/auth/data/auth_providers.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_controller.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/otp_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'otp_controller.g.dart';

@riverpod
class OtpController extends _$OtpController {
  static const int resendSeconds = 5 * 60;

  Timer? _timer;

  @override
  OtpState build() {
    ref.onDispose(() => _timer?.cancel());
    _startCountdown();
    return const OtpState(secondsLeft: resendSeconds);
  }

  Future<bool> verify(String code) async {
    if (state.isVerifying || state.isLocked) return false;
    state = state.copyWith(isVerifying: true, hasError: false);

    final phone = ref.read(authFlowControllerProvider).normalizedPhone!;
    final result = await ref
        .read(authRepositoryProvider)
        .verifyOtp(phone: phone, code: code);
    if (!ref.mounted) return false;

    return result.fold<bool>(
      (_) {
        state = state.copyWith(isVerifying: false, hasError: true);
        return false;
      },
      (isCorrect) {
        state = state.copyWith(
          isVerifying: false,
          wrongAttempts: isCorrect ? 0 : state.wrongAttempts + 1,
        );
        return isCorrect;
      },
    );
  }

  Future<void> resend() async {
    if (!state.canResend) return;
    final phone = ref.read(authFlowControllerProvider).normalizedPhone!;
    final result = await ref.read(authRepositoryProvider).sendOtp(phone);
    if (!ref.mounted) return;
    if (result is Err) {
      state = state.copyWith(hasError: true);
      return;
    }
    state = const OtpState(secondsLeft: resendSeconds);
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final secondsLeft = state.secondsLeft - 1;
      state = state.copyWith(secondsLeft: secondsLeft);
      if (secondsLeft <= 0) timer.cancel();
    });
  }
}
