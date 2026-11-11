// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get appName => 'J\'Donuts';

  @override
  String get continueAction => 'ဆက်လုပ်မည်';

  @override
  String get backTooltip => 'နောက်သို့';

  @override
  String get offlineBanner =>
      'အင်တာနက်မရှိပါ။ သိမ်းထားသော အချက်အလက်များကို ပြသနေသည်။';

  @override
  String get comingSoon => 'မကြာမီ လာမည်';

  @override
  String get retryAction => 'ထပ်ကြိုးစားမည်';

  @override
  String get termsOfUse => 'အသုံးပြုမှု စည်းကမ်းများ';

  @override
  String get privacyPolicy => 'ကိုယ်ရေးအချက်အလက် မူဝါဒ';

  @override
  String get navHome => 'ပင်မ';

  @override
  String get navReward => 'ဆုလာဘ်';

  @override
  String get navScan => 'စကန်ဖတ်';

  @override
  String get navWallet => 'ပိုက်ဆံအိတ်';

  @override
  String get navSettings => 'ဆက်တင်';

  @override
  String get screenOnboarding => 'စတင်ခြင်း';

  @override
  String get screenPhone => 'ဖုန်းနံပါတ်';

  @override
  String get screenOtp => 'နံပါတ်အတည်ပြုခြင်း';

  @override
  String get screenName => 'သင့်အမည်';

  @override
  String get screenDateOfBirth => 'မွေးနေ့';

  @override
  String get screenWelcome => 'ကြိုဆိုပါသည်';

  @override
  String screenProduct(String id) {
    return 'ပစ္စည်း $id';
  }
}
