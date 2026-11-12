import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/entrance.dart';
import 'package:j_donuts_app/core/widgets/skeleton.dart';
import 'package:j_donuts_app/features/home/presentation/widgets/async_section.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/member/presentation/member_provider.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge.dart';
import 'package:j_donuts_app/features/rewards/presentation/rewards_providers.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/challenge_card.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/points_ring.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/reward_tabs.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/rewards_badge_button.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/tier_ladder.dart';

class RewardsScreen extends ConsumerWidget {
  const RewardsScreen({super.key});

  static const double _cardSkeletonHeight = 128;
  static const int _cardSkeletonCount = 3;

  static const double _ringVisibleWidth = 190;

  static const LinearGradient _tabsBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.white,
      AppColors.white,
      AppColors.greySurface,
      AppColors.greySurface,
    ],
    stops: [0, 0.5, 0.5, 1], 
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.greySurface,
      body: switch (ref.watch(memberProvider)) {
        AsyncData(value: final Member member) => _buildContent(member),
        AsyncData() => _buildMessage(context.l10n.sectionEmpty),
        AsyncError() => _buildMessage(
          context.l10n.rewardsError,
          onRetry: () => ref.invalidate(memberProvider),
        ),
        _ => _buildSkeleton(),
      },
    );
  }

  Widget _buildContent(Member member) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ColoredBox(
          color: AppColors.white,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppSpacing.screenGutter,
                top: AppSpacing.xxl,
                bottom: AppSpacing.xxl,
              ),
              child: Column(
                children: [
                  Entrance(child: _Header(member: member)),
                  const SizedBox(height: AppSpacing.xxxl),
                  _buildTiersAndRing(member),
                ],
              ),
            ),
          ),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(gradient: _tabsBackground),
          child: RewardTabs(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.screenGutter,
            AppSpacing.xl,
            AppSpacing.screenGutter,
            AppSpacing.xxl,
          ),
          child: _ChallengeTabView(),
        ),
      ],
    );
  }

  Widget _buildTiersAndRing(Member member) {
    return Row(
      spacing: AppSpacing.md,
      children: [
        Expanded(child: TierLadder(member: member)),
        SizedBox(
          width: _ringVisibleWidth,
          height: PointsRing.size,
          child: OverflowBox(
            alignment: Alignment.centerLeft,
            maxWidth: PointsRing.size,
            child: PointsRing(member: member),
          ),
        ),
      ],
    );
  }

  Widget _buildMessage(String message, {VoidCallback? onRetry}) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenGutter),
        child: SectionMessage(message: message, onRetry: onRetry),
      ),
    );
  }

  Widget _buildSkeleton() {
    return SafeArea(
      child: SkeletonShimmer(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.screenGutter),
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: SkeletonBox(
                width: PointsRing.size,
                height: PointsRing.size,
                radius: AppRadii.pill,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            for (var i = 0; i < _cardSkeletonCount; i++)
              const Padding(
                padding: EdgeInsets.only(bottom: AppSpacing.lg),
                child: SkeletonBox(
                  height: _cardSkeletonHeight,
                  radius: AppRadii.xl,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(context.l10n.rewardsTitle, style: AppTypography.title),
        ),
        const SizedBox(width: AppSpacing.md),
        RewardsBadgeButton(count: member.rewardCount),
      ],
    );
  }
}

class _ChallengeTabView extends ConsumerWidget {
  const _ChallengeTabView();

  static const double _slideOffset = 0.1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(selectedRewardTabProvider);
    return AnimatedSwitcher(
      duration: context.motion(AppMotion.medium),
      switchInCurve: AppMotion.emphasized,
      layoutBuilder: (current, previous) => Stack(
        alignment: Alignment.topCenter,
        children: [...previous, ?current],
      ),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween(
            begin: const Offset(_slideOffset, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      child: KeyedSubtree(
        key: ValueKey(tab),
        child: AsyncSection<Challenge>(
          value: ref.watch(challengesProvider(tab)),
          skeleton: const SkeletonShimmer(
            child: SkeletonBox(
              height: RewardsScreen._cardSkeletonHeight,
              radius: AppRadii.xl,
            ),
          ),
          builder: (challenges) => ChallengeList(challenges: challenges),
          onRetry: () => ref.invalidate(challengesProvider(tab)),
        ),
      ),
    );
  }
}
