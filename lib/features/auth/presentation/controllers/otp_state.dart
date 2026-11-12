import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

@freezed
abstract class OtpState with _$OtpState {
  const factory OtpState({
    required int secondsLeft,
    @Default(0) int wrongAttempts,
    @Default(false) bool isVerifying,
    @Default(false) bool hasError,
  }) = _OtpState;

  const OtpState._();

  static const int maxWrongAttempts = 3;

  bool get isLocked => wrongAttempts >= maxWrongAttempts;

  bool get canResend => secondsLeft == 0;
}
