import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';

class StepProgressRing extends StatelessWidget {
  const StepProgressRing({
    required this.step,
    required this.totalSteps,
    super.key,
  });

  static const double _trackOpacity = 0.35;

  final int step;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: AppSizes.progressRing,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: (step - 1) / totalSteps, end: step / totalSteps),
        duration: context.motion(AppMotion.slow),
        curve: AppMotion.emphasized,
        builder: (context, value, _) => AnimatedSwitcher(
          duration: context.motion(AppMotion.medium),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: value == 1 ? _check : _ring(value),
        ),
      ),
    );
  }

  Widget get _check => const Icon(
    Icons.check_circle,
    key: ValueKey('check'),
    color: AppColors.pink,
    size: AppSizes.progressRing,
  );

  Widget _ring(double value) => CircularProgressIndicator(
    key: const ValueKey('ring'),
    value: value,
    strokeWidth: AppSizes.progressRingStroke,
    color: AppColors.pink,
    backgroundColor: AppColors.cyan.withValues(alpha: _trackOpacity),
  );
}
