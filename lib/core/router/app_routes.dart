/// Route paths. Screens navigate with these constants, never string literals.
abstract final class AppRoutes {
  static const String onboarding = '/onboarding';

  static const String registerPhone = '/register/phone';
  static const String registerOtp = '/register/otp';
  static const String registerName = '/register/name';
  static const String registerDateOfBirth = '/register/dob';

  static const String loginPhone = '/login/phone';
  static const String loginOtp = '/login/otp';

  static const String welcome = '/welcome';

  static const String home = '/home';
  static const String rewards = '/rewards';
  static const String scan = '/scan';
  static const String wallet = '/wallet';
  static const String settings = '/settings';

  static const String productIdParam = 'id';
  static const String product = '/product/:$productIdParam';

  static String productDetail(String id) => '/product/$id';

  /// Routes reachable without a session.
  static const Set<String> public = {
    onboarding,
    registerPhone,
    registerOtp,
    registerName,
    registerDateOfBirth,
    loginPhone,
    loginOtp,
  };
}
