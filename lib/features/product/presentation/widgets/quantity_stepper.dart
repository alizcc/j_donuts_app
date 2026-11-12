import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    required this.quantity,
    required this.onChanged,
    super.key,
  });

  static const int minQuantity = 1;
  static const int maxQuantity = 99;
  static const double _numberWidth = 40;
  static const double stepperBorderWidth = 2.5;

  final int quantity;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DecoratedBox(
      decoration: const ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(
            color: AppColors.skeletonHighlight,
            width: stepperBorderWidth,
          ),
        ),
        color: AppColors.greySurface,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepButton(
            icon: Icons.remove,
            tooltip: l10n.decreaseQuantity,
            onTap: quantity > minQuantity
                ? () => onChanged(quantity - 1)
                : null,
          ),
          SizedBox(width: _numberWidth, child: _buildNumber(context)),
          _StepButton(
            icon: Icons.add,
            tooltip: l10n.increaseQuantity,
            onTap: quantity < maxQuantity
                ? () => onChanged(quantity + 1)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildNumber(BuildContext context) {
    return AnimatedSwitcher(
      duration: context.motion(AppMotion.fast),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(scale: animation, child: child),
      ),
      child: Text(
        '$quantity',
        key: ValueKey(quantity),
        textAlign: TextAlign.center,
        style: AppTypography.title,
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, required this.tooltip, this.onTap});

  final IconData icon;
  final String tooltip;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: IconButton.filled(
        tooltip: tooltip,
        onPressed: onTap,
        style: IconButton.styleFrom(
          backgroundColor: AppColors.cyan,
          disabledBackgroundColor: AppColors.cyan,
          foregroundColor: AppColors.white,
          disabledForegroundColor: AppColors.white,
        ),
        icon: Icon(icon),
      ),
    );
  }
}
