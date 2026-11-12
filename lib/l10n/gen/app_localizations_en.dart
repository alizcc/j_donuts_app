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

  @override
  String get welcomeTitle => 'Welcome to the\nworld of J\'donuts';

  @override
  String get letsExplore => 'Let\'s explore';

  @override
  String get tierBronze => 'Bronze';

  @override
  String get tierSilver => 'Silver';

  @override
  String get tierGold => 'Gold';

  @override
  String get tierPlatinum => 'Platinum';

  @override
  String memberTier(String tier) {
    return '$tier member';
  }

  @override
  String pointsToNextTier(String points, String tier) {
    return '$points points left to become $tier Member';
  }

  @override
  String get topTierReached => 'You\'re at the top tier';

  @override
  String get notificationsTooltip => 'Notifications';

  @override
  String get seeAllTooltip => 'See all';

  @override
  String get sectionSeasonal => 'Seasonal specials';

  @override
  String get sectionPopular => 'Popular 🔥';

  @override
  String get sectionOrderAgain => 'Order again';

  @override
  String discountBadge(int percent) {
    return '$percent% off';
  }

  @override
  String shopsTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'are $count J\'Donut shops',
      one: 'is 1 J\'Donut shop',
    );
    return 'There $_temp0 near you.';
  }

  @override
  String get exploreNow => 'Explore now';

  @override
  String get orderOnline => 'Order Online';

  @override
  String get sectionEmpty => 'Nothing here yet';

  @override
  String get sectionError => 'Couldn\'t load this section';

  @override
  String get refreshFailed => 'Couldn\'t refresh. Showing saved data.';

  @override
  String get newBadge => 'New';

  @override
  String priceMmk(String amount) {
    return '$amount MMK';
  }

  @override
  String get whatsThis => 'What\'s\nthis?';

  @override
  String get addToCart => 'Add to cart';

  @override
  String addedToCart(int quantity, String name) {
    return 'Added $quantity × $name';
  }

  @override
  String get decreaseQuantity => 'Decrease quantity';

  @override
  String get increaseQuantity => 'Increase quantity';

  @override
  String get productNotFound => 'This product is no longer available';

  @override
  String get productError => 'Couldn\'t load this product';

  @override
  String get rewardsTitle => 'J\' Donuts Rewards';

  @override
  String get myRewards => 'Rewards';

  @override
  String rewardPoints(int points) {
    final intl.NumberFormat pointsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String pointsString = pointsNumberFormat.format(points);

    return '$pointsString';
  }

  @override
  String get tabEatMore => 'Eat more earn more';

  @override
  String get tabGift => 'Gift';

  @override
  String get earnAction => 'Earn';

  @override
  String get rewardsError => 'Couldn\'t load your rewards';

  @override
  String get totalPoints => 'Total points';

  @override
  String get tierHereNow => 'You\'re here now';

  @override
  String tierRemaining(int points, String tier) {
    final intl.NumberFormat pointsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String pointsString = pointsNumberFormat.format(points);

    return '$pointsString pts Remaining to become $tier';
  }

  @override
  String get tierSoon => 'You\'ll be here soon';

  @override
  String get tierUnlocked => 'Unlocked';

  @override
  String challengeCount(int progress, int goal) {
    return '$progress/$goal';
  }

  @override
  String challengePoints(int points) {
    return '$points pts';
  }
}
