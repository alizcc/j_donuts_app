import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/coming_soon.dart';
import 'package:j_donuts_app/core/widgets/skeleton.dart';
import 'package:j_donuts_app/features/home/presentation/home_section_providers.dart';
import 'package:j_donuts_app/features/home/presentation/widgets/async_section.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/member/presentation/member_provider.dart';

class MemberHeader extends ConsumerWidget {
  const MemberHeader({super.key});

  static const double _avatarRadius = 24;
  static const double _skeletonHeight = 72;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (ref.watch(memberProvider)) {
      AsyncData(value: final Member member) => _buildMember(
        context,
        ref,
        member,
      ),
      AsyncData() => const SizedBox.shrink(),
      AsyncError() => SectionMessage(
        message: context.l10n.sectionError,
        onRetry: () => ref.invalidate(memberProvider),
      ),
      _ => const SkeletonShimmer(child: SkeletonBox(height: _skeletonHeight)),
    };
  }

  Widget _buildMember(BuildContext context, WidgetRef ref, Member member) {
    final l10n = context.l10n;
    final name = ref.watch(signedInFirstNameProvider).value ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: _avatarRadius,
              backgroundColor: AppColors.pink,
              child: Icon(Icons.person, color: AppColors.white),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTypography.display, maxLines: 1),
                  Text(
                    l10n.memberTier(member.tier.label(l10n)),
                    style: AppTypography.caption.copyWith(color: AppColors.ink),
                  ),
                ],
              ),
            ),
            _NotificationBell(count: member.notificationCount),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.screenGutter),
          child: _buildPointsPill(context, member),
        ),
      ],
    );
  }

  Widget _buildPointsPill(BuildContext context, Member member) {
    final l10n = context.l10n;
    final nextTier = member.nextTier;
    final text = nextTier == null
        ? l10n.topTierReached
        : l10n.pointsToNextTier(
            '${member.pointsToNextTier}',
            nextTier.label(l10n),
          );
    return Align(
      alignment: Alignment.centerLeft,
      child: DecoratedBox(
        decoration: const ShapeDecoration(
          shape: StadiumBorder(side: BorderSide(color: AppColors.greyTrack)),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          child: Text(
            text,
            style: AppTypography.caption.copyWith(color: AppColors.ink),
          ),
        ),
      ),
    );
  }
}

class _NotificationBell extends StatelessWidget {
  const _NotificationBell({required this.count});

  static const double _countSize = 18;
  static const ShapeBorder _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.horizontal(left: Radius.circular(AppRadii.pill)),
  );

  final int count;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.orange,
      shape: _shape,
      child: InkWell(
        customBorder: _shape,
        onTap: () => showComingSoon(context),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.xs,
            AppSpacing.sm,
            AppSpacing.xs,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppSpacing.xs,
            children: [
              Icon(
                Icons.notifications_none,
                color: AppColors.white,
                semanticLabel: context.l10n.notificationsTooltip,
              ),
              if (count > 0)
                CircleAvatar(
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
            ],
          ),
        ),
      ),
    );
  }
}
