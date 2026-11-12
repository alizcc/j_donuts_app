import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';

typedef BottomNavItem = ({IconData icon, String label});

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.items,
    required this.currentIndex,
    required this.onSelected,
    super.key,
  });

  static const double _iconSize = 26;
  static const double _pillBorderWidth = 2;

  final List<BottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.cyan,
        //borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xl)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.md,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final (index, item) in items.indexed)
                _buildItem(context, index, item),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index, BottomNavItem item) {
    final isSelected = index == currentIndex;
    final duration = context.motion(AppMotion.medium);
    return Semantics(
      button: true,
      selected: isSelected,
      label: item.label,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onSelected(index),
        child: AnimatedContainer(
          duration: duration,
          curve: AppMotion.standard,
          padding: EdgeInsets.symmetric(
            horizontal: isSelected ? AppSpacing.lg : AppSpacing.sm,
            vertical: AppSpacing.sm,
          ),
          decoration: ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(
                color: isSelected ? AppColors.white : AppColors.transparent,
                width: _pillBorderWidth,
              ),
            ),
            color: isSelected ? AppColors.pink : AppColors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon, color: AppColors.white, size: _iconSize),
              AnimatedSize(
                duration: duration,
                curve: AppMotion.standard,
                child: isSelected ? _buildLabel(item.label) : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.xs),
      child: Text(
        label,
        maxLines: 1,
        style: AppTypography.label.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
