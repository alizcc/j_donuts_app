import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/pressable_scale.dart';

class RewardsBadgeButton extends StatelessWidget {
  const RewardsBadgeButton({required this.count, super.key});

  static const double _countSize = 22;

  final int count;

  @override
  Widget build(BuildContext context) {
    return PressableScale(
      onTap: HapticFeedback.selectionClick,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(AppRadii.pill),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.sm,
            AppSpacing.md,
            AppSpacing.sm,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppSpacing.sm,
            children: [
              Text(
                context.l10n.myRewards,
                style: AppTypography.titleSmall.copyWith(
                  color: AppColors.white,
                ),
              ),
              if (count > 0) _buildCount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCount(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: context.motion(AppMotion.badgePop),
      curve: AppMotion.overshoot,
      builder: (context, scale, child) =>
          Transform.scale(scale: scale, child: child),
      child: CircleAvatar(
        radius: _countSize / 2,
        backgroundColor: AppColors.white,
        child: Text(
          '$count',
          style: AppTypography.caption.copyWith(
            color: AppColors.ink,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
