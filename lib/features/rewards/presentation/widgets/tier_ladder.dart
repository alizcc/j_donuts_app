import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/entrance.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/member/presentation/member_provider.dart';

class TierLadder extends StatelessWidget {
  const TierLadder({required this.member, super.key});

  static const List<MemberTier> _tiers = [
    MemberTier.silver,
    MemberTier.gold,
    MemberTier.platinum,
  ];
  static const double _rowGap = 56;
  static const double _connectorWidth = 4;

  static const Curve _fillCurve = Interval(0.4, 1, curve: AppMotion.emphasized);

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final (index, tier) in _tiers.indexed)
          Entrance(
            delay: AppMotion.tierStagger * index,
            child: _buildRow(context, tier, isLast: index == _tiers.length - 1),
          ),
      ],
    );
  }

  Widget _buildRow(
    BuildContext context,
    MemberTier tier, {
    required bool isLast,
  }) {
    return Stack(
      children: [
        if (!isLast)
          Positioned(
            left: (_TierBadge.size - _connectorWidth) / 2,
            top: _TierBadge.size,
            bottom: 0,
            width: _connectorWidth,
            child: _buildConnector(context, tier),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TierBadge(tier: tier, isCurrent: tier == member.tier),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: AppSpacing.xs,
                  bottom: isLast ? 0 : _rowGap,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tier.label(context.l10n),
                      style: AppTypography.titleSmall,
                    ),
                    Text(
                      _status(context, tier),
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _status(BuildContext context, MemberTier tier) {
    final l10n = context.l10n;
    if (tier == member.tier) return l10n.tierHereNow;
    if (tier.index < member.tier.index) return l10n.tierUnlocked;
    if (tier == member.nextTier) {
      return l10n.tierRemaining(member.pointsToNextTier, tier.label(l10n));
    }
    return l10n.tierSoon;
  }

  double _lineFill(MemberTier from) {
    if (member.tier.index > from.index) return 1;
    if (member.tier == from) return member.tierProgress;
    return 0;
  }

  Widget _buildConnector(BuildContext context, MemberTier from) {
    return Container(
      color: AppColors.greyTrack,
      alignment: Alignment.topCenter,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: _lineFill(from)),
        duration: context.motion(AppMotion.ringSweep),
        curve: _fillCurve,
        builder: (context, value, _) => FractionallySizedBox(
          heightFactor: value,
          widthFactor: 1,
          child: const ColoredBox(color: AppColors.inkMuted),
        ),
      ),
    );
  }
}

class _TierBadge extends StatelessWidget {
  const _TierBadge({required this.tier, required this.isCurrent});

  static const double size = 48;
  static const double _otherScale = 0.8;
  static const double _starSize = 9;

  final MemberTier tier;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isCurrent ? 1 : _otherScale,
      duration: context.motion(AppMotion.medium),
      curve: AppMotion.emphasized,
      child: SizedBox.square(
        dimension: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.shield, size: size, color: tier.color),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < tier.index; i++)
                      const Icon(
                        Icons.star,
                        size: _starSize,
                        color: AppColors.inkMuted,
                      ),
                  ],
                ),
                Text(
                  tier.name[0].toUpperCase(),
                  style: AppTypography.label.copyWith(
                    color: AppColors.inkMuted,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on MemberTier {
  Color get color => switch (this) {
    MemberTier.bronze => AppColors.tierBronze,
    MemberTier.silver => AppColors.tierSilver,
    MemberTier.gold => AppColors.tierGold,
    MemberTier.platinum => AppColors.tierPlatinum,
  };
}
