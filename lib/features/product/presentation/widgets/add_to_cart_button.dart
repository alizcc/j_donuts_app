import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/pressable_scale.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    required this.totalLabel,
    required this.onPressed,
    super.key,
  });

  static const double _dividerHeight = 20;
  static const double _dividerOpacity = 0.6;

  final String totalLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PressableScale(
      onTap: onPressed,
      child: Container(
        height: AppSizes.buttonHeight,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColors.cyan,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                context.l10n.addToCart.toUpperCase(),
                style: AppTypography.button,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: 1,
              height: _dividerHeight,
              margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              color: AppColors.white.withValues(alpha: _dividerOpacity),
            ),
            AnimatedSwitcher(
              duration: context.motion(AppMotion.fast),
              child: Text(
                totalLabel,
                key: ValueKey(totalLabel),
                style: AppTypography.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
