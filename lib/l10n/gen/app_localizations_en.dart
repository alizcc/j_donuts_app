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
  String get screenOnboarding => 'Onboarding';

  @override
  String get screenPhone => 'Phone number';

  @override
  String get screenOtp => 'Verify number';

  @override
  String get screenName => 'Your name';

  @override
  String get screenDateOfBirth => 'Date of birth';

  @override
  String get screenWelcome => 'Welcome';

  @override
  String screenProduct(String id) {
    return 'Product $id';
  }
}
