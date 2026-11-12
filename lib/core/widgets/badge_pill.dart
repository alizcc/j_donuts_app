import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';

class BadgePill extends StatelessWidget {
  const BadgePill({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.orange,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxs,
        ),
        child: Text(
          label,
          style: AppTypography.caption.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
