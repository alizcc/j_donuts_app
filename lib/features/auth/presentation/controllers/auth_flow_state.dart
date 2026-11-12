import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:j_donuts_app/features/auth/domain/validators/phone_validator.dart';

part 'auth_flow_state.freezed.dart';

enum AuthMode { register, login }

@freezed
abstract class AuthFlowState with _$AuthFlowState {
  const factory AuthFlowState({
    @Default(AuthMode.register) AuthMode mode,
    @Default('') String phoneInput,
    @Default('') String firstName,
    @Default('') String lastName,
    int? birthMonth,
    int? birthDay,
    int? birthYear,
    @Default(false) bool isExistingUser,
    @Default(false) bool isLoading,
    @Default(false) bool phoneNotRegistered,
    @Default(false) bool hasError,
  }) = _AuthFlowState;

  const AuthFlowState._(); 
  // Private named constructor to support custom methods and getters in Freezed.

  String? get normalizedPhone => normalizeMyanmarPhone(phoneInput);
}
