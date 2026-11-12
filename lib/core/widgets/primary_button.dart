import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/pressable_scale.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  static const double _spinnerSize = 22;
  static const double _spinnerStroke = 2.5;

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return PressableScale(
      onTap: enabled && !isLoading ? onPressed : null,
      child: AnimatedContainer(
        duration: context.motion(AppMotion.medium),
        height: AppSizes.buttonHeight,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: enabled ? AppColors.cyan : AppColors.disabled,
        ),
        child: AnimatedSwitcher(
          duration: context.motion(AppMotion.fast),
          child: isLoading ? _spinner : _label,
        ),
      ),
    );
  }

  Widget get _label => Text(
    label.toUpperCase(),
    key: const ValueKey('label'),
    style: AppTypography.button,
  );

  Widget get _spinner => const SizedBox.square(
    key: ValueKey('spinner'),
    dimension: _spinnerSize,
    child: CircularProgressIndicator(
      strokeWidth: _spinnerStroke,
      color: AppColors.white,
    ),
  );
}
