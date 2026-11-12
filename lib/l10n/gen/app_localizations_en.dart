// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'J\'Donuts';

  @override
  String get continueAction => 'Continue';

  @override
  String get backTooltip => 'Back';

  @override
  String get offlineBanner => 'You\'re offline. Showing saved data.';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get retryAction => 'Try again';

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get navHome => 'Home';

  @override
  String get navReward => 'Reward';

  @override
  String get navScan => 'Scan';

  @override
  String get navWallet => 'Wallet';

  @override
  String get navSettings => 'Settings';

  @override
  String get screenWelcome => 'Welcome';

  @override
  String screenProduct(String id) {
    return 'Product $id';
  }

  @override
  String get onboardingTitle => 'Round food for\nevery mood';

  @override
  String get letsGetStarted => 'Let\'s get started';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get logIn => 'Log In';

  @override
  String get termsPrefix =>
      'By continuing, you acknowledge that you have read and agree to our';

  @override
  String get termsAnd => 'and';

  @override
  String get genericError => 'Something went wrong. Please try again.';

  @override
  String get phoneTitle => 'Enter your phone number';

  @override
  String get phoneHint => '09 xxx xxx xxx';

  @override
  String get phoneErrorEmpty => 'Enter your phone number';

  @override
  String get phoneErrorInvalid => 'Enter a valid Myanmar mobile number';

  @override
  String get phoneNotRegistered => 'This number isn\'t registered yet.';

  @override
  String get registerLink => 'Register';

  @override
  String get otpTitle => 'Verify your number';

  @override
  String otpSentTo(String phone) {
    return 'We\'ve sent 6 digit OTP to $phone';
  }

  @override
  String otpWrongCode(int attemptsLeft) {
    String _temp0 = intl.Intl.pluralLogic(
      attemptsLeft,
      locale: localeName,
      other: '$attemptsLeft attempts left.',
      one: '1 attempt left.',
    );
    return 'Wrong code. $_temp0';
  }

  @override
  String get otpLocked => 'Too many wrong codes. Resend to get a new one.';

  @override
  String get otpDidntReceive => 'Didn\'t receive the code?';

  @override
  String get otpResendIn => 'resend in';

  @override
  String get otpMinutes => 'min';

  @override
  String get otpResend => 'Resend';

  @override
  String get nameTitle => 'What\'s your name?';

  @override
  String get firstNameHint => 'First Name';

  @override
  String get lastNameHint => 'Last Name';

  @override
  String get nameErrorEmpty => 'Enter your first name';

  @override
  String nameErrorTooLong(int max) {
    return 'Use $max characters or fewer';
  }

  @override
  String get nameErrorInvalid => 'Use letters and spaces only';

  @override
  String get dobTitle => 'What\'s your date of birth?';

  @override
  String get monthHint => 'Month';

  @override
  String get dayHint => 'Day';

  @override
  String get yearHint => 'Year';

  @override
  String get dobErrorInvalid => 'This date doesn\'t exist';

  @override
  String get dobErrorFuture => 'Date of birth can\'t be in the future';

  @override
  String dobErrorTooYoung(int age) {
    return 'You must be at least $age years old';
  }

  @override
  String get logOut => 'Log out';
}
