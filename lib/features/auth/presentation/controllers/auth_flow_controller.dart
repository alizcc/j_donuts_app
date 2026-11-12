import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/router/auth_status.dart';
import 'package:j_donuts_app/features/auth/data/auth_providers.dart';
import 'package:j_donuts_app/features/auth/domain/user.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_flow_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthFlowController extends _$AuthFlowController {
  @override
  AuthFlowState build() => const AuthFlowState();

  void start(AuthMode mode) => state = AuthFlowState(mode: mode);

  void switchToRegister() => state = state.copyWith(
    mode: AuthMode.register,
    phoneNotRegistered: false,
  );

  void setPhone(String value) => state = state.copyWith(
    phoneInput: value,
    phoneNotRegistered: false,
    hasError: false,
  );

  void setFirstName(String value) => state = state.copyWith(firstName: value);

  void setLastName(String value) => state = state.copyWith(lastName: value);

  void setBirthMonth(int? value) => state = state.copyWith(birthMonth: value);

  void setBirthDay(int? value) => state = state.copyWith(birthDay: value);

  void setBirthYear(int? value) => state = state.copyWith(birthYear: value);

  Future<String?> submitPhone() async {
    final phone = state.normalizedPhone;
    // Ignore double taps while a request is running.
    if (state.isLoading || phone == null) return null;
    state = state.copyWith(isLoading: true, hasError: false);

    final registered = await ref
        .read(authRepositoryProvider)
        .isRegistered(phone);
    final isExisting = registered.fold((_) => null, (value) => value);
    if (isExisting == null) return _fail();
    if (state.mode == AuthMode.login && !isExisting) {
      state = state.copyWith(isLoading: false, phoneNotRegistered: true);
      return null;
    }

    final sent = await ref.read(authRepositoryProvider).sendOtp(phone);
    if (sent is Err) return _fail();
    state = state.copyWith(isLoading: false, isExistingUser: isExisting);
    return state.mode == AuthMode.login
        ? AppRoutes.loginOtp
        : AppRoutes.registerOtp;
  }

  Future<String?> continueAfterOtp() async {
    if (!state.isExistingUser) return AppRoutes.registerName;
    if (state.isLoading) return null;
    state = state.copyWith(isLoading: true, hasError: false);

    final result = await ref
        .read(authRepositoryProvider)
        .login(state.normalizedPhone!);
    if (result is Err) return _fail();
    _signIn();
    return AppRoutes.home;
  }

  String submitName() => AppRoutes.registerDateOfBirth;

  Future<String?> submitDateOfBirth() async {
    if (state.isLoading) return null;
    state = state.copyWith(isLoading: true, hasError: false);
    final user = User(
      phone: state.normalizedPhone!,
      firstName: state.firstName.trim(),
      lastName: state.lastName.trim().isEmpty ? null : state.lastName.trim(),
      dateOfBirth: DateTime(
        state.birthYear!,
        state.birthMonth!,
        state.birthDay!,
      ),
    );
    final result = await ref.read(authRepositoryProvider).register(user);
    if (result is Err) return _fail();
    _signIn();
    return AppRoutes.welcome;
  }

  void _signIn() {
    state = const AuthFlowState();
    ref
        .read(authStatusControllerProvider.notifier)
        .update(AuthStatus.authenticated);
  }

  String? _fail() {
    state = state.copyWith(isLoading: false, hasError: true);
    return null;
  }
}
