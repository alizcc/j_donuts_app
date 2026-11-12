import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({required this.isOffline, super.key});

  static const double _iconSize = 16;

  final bool isOffline;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: context.motion(AppMotion.medium),
      curve: AppMotion.emphasized,
      child: isOffline ? _buildStrip(context) : const SizedBox.shrink(),
    );
  }

  Widget _buildStrip(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.ink,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off, size: _iconSize, color: AppColors.white),
          const SizedBox(width: AppSpacing.sm),
          Flexible(
            child: Text(
              context.l10n.offlineBanner,
              style: AppTypography.caption.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
