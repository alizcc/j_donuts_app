import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge.dart';
import 'package:j_donuts_app/features/rewards/presentation/rewards_providers.dart';

class RewardTabs extends ConsumerWidget {
  const RewardTabs({super.key});

  static const EdgeInsets _tabGap = EdgeInsets.symmetric(
    horizontal: AppSpacing.xs,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedRewardTabProvider);
    return DefaultTabController(
      length: RewardTab.values.length,
      initialIndex: selected.index,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        dividerHeight: 0,
        labelPadding: _tabGap,
        indicatorPadding: _tabGap,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 0,
        indicator: const ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColors.cyan,
        ),
        overlayColor: const WidgetStatePropertyAll(AppColors.transparent),
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.inkMuted,
        labelStyle: AppTypography.titleSmall,
        unselectedLabelStyle: AppTypography.titleSmall.copyWith(
          fontWeight: FontWeight.w400,
        ),
        onTap: (index) => ref
            .read(selectedRewardTabProvider.notifier)
            .select(RewardTab.values[index]),
        tabs: [
          for (final tab in RewardTab.values)
            _TabPill(label: _label(context, tab), isSelected: tab == selected),
        ],
      ),
    );
  }

  String _label(BuildContext context, RewardTab tab) => switch (tab) {
    RewardTab.eat => context.l10n.tabEatMore,
    RewardTab.gift => context.l10n.tabGift,
  };
}

class _TabPill extends StatelessWidget {
  const _TabPill({required this.label, required this.isSelected});

  static const double _borderWidth = 3;

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: context.motion(AppMotion.medium),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.sm,
      ),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(
          side: BorderSide(color: AppColors.white, width: _borderWidth),
        ),
        color: isSelected ? AppColors.transparent : AppColors.glazeGrey,
      ),
      child: Text(label, maxLines: 1),
    );
  }
}
