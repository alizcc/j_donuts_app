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

  @override
  String get welcomeTitle => 'J\'donuts ကမ္ဘာမှ\nကြိုဆိုပါတယ်';

  @override
  String get letsExplore => 'စတင်ကြည့်ရှုမည်';

  @override
  String get tierBronze => 'ကြေး';

  @override
  String get tierSilver => 'ငွေ';

  @override
  String get tierGold => 'ရွှေ';

  @override
  String get tierPlatinum => 'ပလက်တီနမ်';

  @override
  String memberTier(String tier) {
    return '$tier အဖွဲ့ဝင်';
  }

  @override
  String pointsToNextTier(String points, String tier) {
    return '$tier အဖွဲ့ဝင်ဖြစ်ရန် $points မှတ် လိုပါသေးသည်';
  }

  @override
  String get topTierReached => 'အမြင့်ဆုံးအဆင့်သို့ ရောက်ရှိပြီ';

  @override
  String get notificationsTooltip => 'အသိပေးချက်များ';

  @override
  String get seeAllTooltip => 'အားလုံးကြည့်ရန်';

  @override
  String get sectionSeasonal => 'ရာသီအထူး';

  @override
  String get sectionPopular => 'လူကြိုက်များ 🔥';

  @override
  String get sectionOrderAgain => 'ထပ်မံမှာယူရန်';

  @override
  String discountBadge(int percent) {
    return '$percent% လျှော့';
  }

  @override
  String shopsTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'သင့်အနီးတွင် J\'Donut ဆိုင် $count ဆိုင် ရှိပါသည်။',
    );
    return '$_temp0';
  }

  @override
  String get exploreNow => 'ကြည့်ရှုမည်';

  @override
  String get orderOnline => 'အွန်လိုင်းမှာယူရန်';

  @override
  String get sectionEmpty => 'မရှိသေးပါ';

  @override
  String get sectionError => 'ဤအပိုင်းကို ဖွင့်၍မရပါ';

  @override
  String get refreshFailed =>
      'အသစ်မရယူနိုင်ပါ။ သိမ်းထားသော အချက်အလက်ကို ပြသနေသည်။';

  @override
  String get newBadge => 'အသစ်';

  @override
  String priceMmk(String amount) {
    return '$amount ကျပ်';
  }

  @override
  String get whatsThis => 'ဒါက\nဘာလဲ?';

  @override
  String get addToCart => 'ခြင်းထဲထည့်မည်';

  @override
  String addedToCart(int quantity, String name) {
    return '$name $quantity ခု ထည့်ပြီးပါပြီ';
  }

  @override
  String get decreaseQuantity => 'အရေအတွက် လျှော့ရန်';

  @override
  String get increaseQuantity => 'အရေအတွက် တိုးရန်';

  @override
  String get productNotFound => 'ဤပစ္စည်း မရနိုင်တော့ပါ';

  @override
  String get productError => 'ဤပစ္စည်းကို ဖွင့်၍မရပါ';

  @override
  String get rewardsTitle => 'J\' Donuts ဆုလာဘ်များ';

  @override
  String get myRewards => 'ဆုလာဘ်';

  @override
  String rewardPoints(int points) {
    final intl.NumberFormat pointsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String pointsString = pointsNumberFormat.format(points);

    return '$pointsString';
  }

  @override
  String get tabEatMore => 'များများစား များများရ';

  @override
  String get tabGift => 'လက်ဆောင်';

  @override
  String get earnAction => 'ရယူမည်';

  @override
  String get rewardsError => 'ဆုလာဘ်များကို ဖွင့်၍မရပါ';

  @override
  String get totalPoints => 'စုစုပေါင်းမှတ်';

  @override
  String get tierHereNow => 'လက်ရှိအဆင့်';

  @override
  String tierRemaining(int points, String tier) {
    final intl.NumberFormat pointsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String pointsString = pointsNumberFormat.format(points);

    return '$tier ဖြစ်ရန် $pointsString မှတ် လိုသေးသည်';
  }

  @override
  String get tierSoon => 'မကြာမီ ရောက်ရှိမည်';

  @override
  String get tierUnlocked => 'ရရှိပြီး';

  @override
  String challengeCount(int progress, int goal) {
    return '$progress/$goal';
  }

  @override
  String challengePoints(int points) {
    return '$points မှတ်';
  }
}
