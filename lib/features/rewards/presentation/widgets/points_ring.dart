import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/points_ring_painter.dart';

class PointsRing extends StatelessWidget {
  const PointsRing({required this.member, super.key});

  static const double size = 220;

  final Member member;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: member.tierProgress),
        duration: context.motion(AppMotion.ringSweep),
        curve: AppMotion.emphasized,
        builder: (context, progress, child) => CustomPaint(
          painter: PointsRingPainter(progress: progress),
          child: child,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            size * PointsRingPainter.strokeRatio + AppSpacing.sm,
          ),
          child: Center(child: _buildTotal(context)),
        ),
      ),
    );
  }

  Widget _buildTotal(BuildContext context) {
    final l10n = context.l10n;
    return FittedBox(
      child: Column(
        children: [
          Text(
            l10n.totalPoints,
            style: AppTypography.label.copyWith(color: AppColors.pink),
          ),
          TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0, end: member.points),
            duration: context.motion(AppMotion.countUp),
            curve: AppMotion.emphasized,
            builder: (context, points, _) => Text(
              l10n.rewardPoints(points),
              style: AppTypography.display.copyWith(color: AppColors.pink),
            ),
          ),
        ],
      ),
    );
  }
}
