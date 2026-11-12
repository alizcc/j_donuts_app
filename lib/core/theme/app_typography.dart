import 'package:flutter/painting.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';

/// Font families bundled under `assets/fonts`. The designs use Fredoka
/// throughout.
abstract final class AppFonts {
  static const String display = 'Fredoka';
  static const String body = 'Fredoka';
}

/// Named text styles. Headings are SemiBold, body Regular.
abstract final class AppTypography {
  static const TextStyle display = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.15,
    color: AppColors.ink,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 36,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.ink,
  );

  static const TextStyle title = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: AppColors.ink,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.ink,
  );

  static const TextStyle body = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.ink,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.inkMuted,
  );

  static const TextStyle label = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: AppColors.ink,
  );

  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.6,
    height: 1.2,
    color: AppColors.white,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.inkSubtle,
  );
}
