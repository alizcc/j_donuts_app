import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/pressable_scale.dart';

class EarnButton extends StatefulWidget {
  const EarnButton({required this.isActive, super.key});

  final bool isActive;

  @override
  State<EarnButton> createState() => _EarnButtonState();
}

class _EarnButtonState extends State<EarnButton> {
  // flipped in onEnd to keep the pulse looping
  bool _grown = true;

  @override
  Widget build(BuildContext context) {
    final pulses = widget.isActive && !context.reduceMotion;
    return PressableScale(
      onTap: HapticFeedback.selectionClick,
      child: TweenAnimationBuilder<double>(
        tween: Tween(
          begin: 1,
          end: pulses && _grown ? AppMotion.pulseScale : 1,
        ),
        duration: AppMotion.pulse,
        curve: AppMotion.standard,
        onEnd: pulses ? () => setState(() => _grown = !_grown) : null,
        builder: (context, scale, child) =>
            Transform.scale(scale: scale, child: child),
        child: _buildPill(context),
      ),
    );
  }

  Widget _buildPill(BuildContext context) {
    return AnimatedContainer(
      duration: context.motion(AppMotion.medium),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.md,
      ),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: widget.isActive ? AppColors.cyan : AppColors.disabled,
      ),
      child: Text(
        context.l10n.earnAction.toUpperCase(),
        style: AppTypography.button,
      ),
    );
  }
}
