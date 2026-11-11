import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';

/// Builds the app's [ThemeData] from the design tokens.
abstract final class AppTheme {
  static const double _fieldBorderWidth = 1.5;

  static ThemeData light() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.cyan,
        secondary: AppColors.pink,
        onSecondary: AppColors.white,
        tertiary: AppColors.orange,
        error: AppColors.error,
        onSurface: AppColors.ink,
        surfaceContainerHighest: AppColors.greySurface,
      ),
      scaffoldBackgroundColor: AppColors.white,
      fontFamily: AppFonts.body,
      textTheme: const TextTheme(
        displayLarge: AppTypography.display,
        headlineMedium: AppTypography.headline,
        titleLarge: AppTypography.title,
        titleMedium: AppTypography.titleSmall,
        bodyLarge: AppTypography.body,
        bodyMedium: AppTypography.bodySmall,
        labelLarge: AppTypography.label,
        bodySmall: AppTypography.caption,
      ),
      inputDecorationTheme: _inputTheme(),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.pink,
          textStyle: AppTypography.label,
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.ink,
      ),
    );
  }

  /// White rounded fields: no border at rest, cyan when focused, red on
  /// error. Material animates between these states for us.
  static InputDecorationTheme _inputTheme() {
    final subtle = AppTypography.body.copyWith(color: AppColors.inkSubtle);
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      hintStyle: subtle,
      prefixStyle: subtle,
      errorStyle: AppTypography.bodySmall.copyWith(color: AppColors.error),
      contentPadding: const EdgeInsets.all(AppSpacing.lg),
      border: _border(Colors.transparent),
      enabledBorder: _border(Colors.transparent),
      focusedBorder: _border(AppColors.cyan),
      errorBorder: _border(AppColors.error),
      focusedErrorBorder: _border(AppColors.error),
    );
  }

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppRadii.sm),
    borderSide: BorderSide(color: color, width: _fieldBorderWidth),
  );
}
