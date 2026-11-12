import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/arc_painter.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/coffee_glass_painter.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/donut_progress_painter.dart';

class ChallengeArtwork extends StatelessWidget {
  const ChallengeArtwork({required this.challenge, super.key});

  static const double size = 96;
  static const double _gaugeStroke = 8;
  static const Size _glassSize = Size(40, 58);

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: challenge.progress / challenge.goal),
        duration: context.motion(AppMotion.ringSweep),
        curve: AppMotion.emphasized,
        builder: (context, fraction, _) => switch (challenge.art) {
          ChallengeArt.donut => CustomPaint(
            painter: DonutProgressPainter(fraction: fraction),
          ),
          ChallengeArt.coffee => _buildCoffee(fraction),
        },
      ),
    );
  }

  Widget _buildCoffee(double fraction) {
    return CustomPaint(
      painter: ArcPainter(
        progress: fraction,
        color: AppColors.orange,
        trackColor: AppColors.greyTrack,
        strokeWidth: _gaugeStroke,
        startAngle: math.pi,
        sweepAngle: math.pi,
      ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: CustomPaint(size: _glassSize, painter: CoffeeGlassPainter()),
      ),
    );
  }
}
