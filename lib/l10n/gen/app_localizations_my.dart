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
  String get screenWelcome => 'ကြိုဆိုပါသည်';

  @override
  String screenProduct(String id) {
    return 'ပစ္စည်း $id';
  }

  @override
  String get onboardingTitle => 'စိတ်ခံစားမှုတိုင်းအတွက် အဝိုင်းလေးတွေ';

  @override
  String get letsGetStarted => 'စတင်လိုက်ရအောင်';

  @override
  String get alreadyHaveAccount => 'အကောင့်ရှိပြီးသားလား?';

  @override
  String get logIn => 'ဝင်ရောက်မည်';

  @override
  String get termsPrefix =>
      'ဆက်လုပ်ခြင်းဖြင့် အောက်ပါတို့ကို ဖတ်ရှုပြီး သဘောတူကြောင်း အသိအမှတ်ပြုပါသည်';

  @override
  String get termsAnd => 'နှင့်';

  @override
  String get genericError => 'တစ်ခုခု မှားယွင်းသွားပါသည်။ ထပ်ကြိုးစားပါ။';

  @override
  String get phoneTitle => 'သင့်ဖုန်းနံပါတ် ထည့်ပါ';

  @override
  String get phoneHint => '09 xxx xxx xxx';

  @override
  String get phoneErrorEmpty => 'ဖုန်းနံပါတ် ထည့်ပါ';

  @override
  String get phoneErrorInvalid => 'မှန်ကန်သော မြန်မာဖုန်းနံပါတ် ထည့်ပါ';

  @override
  String get phoneNotRegistered => 'ဤနံပါတ်ဖြင့် စာရင်းမသွင်းရသေးပါ။';

  @override
  String get registerLink => 'စာရင်းသွင်းမည်';

  @override
  String get otpTitle => 'နံပါတ်ကို အတည်ပြုပါ';

  @override
  String otpSentTo(String phone) {
    return '$phone သို့ ဂဏန်း ၆ လုံး OTP ပို့ထားပါသည်';
  }

  @override
  String otpWrongCode(int attemptsLeft) {
    return 'ကုဒ်မှားနေပါသည်။ နောက်ထပ် $attemptsLeft ကြိမ် ကြိုးစားနိုင်ပါသည်။';
  }

  @override
  String get otpLocked => 'ကုဒ်မှားသည်မှာ များလွန်းပါသည်။ ကုဒ်အသစ် ပြန်ပို့ပါ။';

  @override
  String get otpDidntReceive => 'ကုဒ်မရရှိဘူးလား?';

  @override
  String get otpResendIn => 'ပြန်ပို့ရန်';

  @override
  String get otpMinutes => 'မိနစ်';

  @override
  String get otpResend => 'ပြန်ပို့မည်';

  @override
  String get nameTitle => 'သင့်အမည် ဘယ်လိုခေါ်လဲ?';

  @override
  String get firstNameHint => 'အမည်';

  @override
  String get lastNameHint => 'မျိုးနွယ်အမည်';

  @override
  String get nameErrorEmpty => 'အမည် ထည့်ပါ';

  @override
  String nameErrorTooLong(int max) {
    return 'စာလုံး $max လုံးထက် မပိုရပါ';
  }

  @override
  String get nameErrorInvalid => 'စာလုံးနှင့် နေရာလွတ်များသာ သုံးပါ';

  @override
  String get dobTitle => 'သင့်မွေးနေ့ ဘယ်နေ့လဲ?';

  @override
  String get monthHint => 'လ';

  @override
  String get dayHint => 'ရက်';

  @override
  String get yearHint => 'နှစ်';

  @override
  String get dobErrorInvalid => 'ဤရက်စွဲ မရှိပါ';

  @override
  String get dobErrorFuture => 'မွေးနေ့သည် အနာဂတ်ရက်စွဲ မဖြစ်ရပါ';

  @override
  String dobErrorTooYoung(int age) {
    return 'အသက် အနည်းဆုံး $age နှစ် ပြည့်ရပါမည်';
  }

  @override
  String get logOut => 'ထွက်မည်';
}
