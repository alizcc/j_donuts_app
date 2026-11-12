import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/network/network_providers.dart';
import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/widgets/entrance.dart';
import 'package:j_donuts_app/core/widgets/skeleton.dart';
import 'package:j_donuts_app/features/home/data/home_providers.dart';
import 'package:j_donuts_app/features/home/domain/home_banner.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:j_donuts_app/features/home/presentation/home_section_providers.dart';
import 'package:j_donuts_app/features/home/presentation/widgets/async_section.dart';
import 'package:j_donuts_app/features/home/presentation/widgets/banner_carousel.dart';
import 'package:j_donuts_app/features/home/presentation/widgets/member_header.dart';
import 'package:j_donuts_app/features/home/presentation/widgets/product_section.dart';
import 'package:j_donuts_app/features/home/presentation/widgets/shops_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static Duration _stagger(int index) => AppMotion.stagger * index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(isOnlineProvider, (previous, next) {
      final cameOnline = previous?.value != true && next.value == true;
      if (cameOnline) unawaited(ref.read(homeRepositoryProvider).refresh());
    });

    return Scaffold(
      backgroundColor: AppColors.greySurface,
      body: RefreshIndicator(
        onRefresh: () => _refresh(context, ref),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Entrance(child: _buildHeader(ref)),
            for (final (index, section) in HomeSection.values.indexed)
              Entrance(
                delay: _stagger(index + 1),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.screenGutter,
                    AppSpacing.xxl,
                    0,
                    0,
                  ),
                  child: ProductSection(section: section),
                ),
              ),
            const SizedBox(height: AppSpacing.xxxl),
            Entrance(
              delay: _stagger(HomeSection.values.length + 1),
              child: const ShopsSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(WidgetRef ref) {
    return ColoredBox(
      color: AppColors.homeHeader,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenGutter,
            AppSpacing.lg,
            0,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MemberHeader(),
              const SizedBox(height: AppSpacing.lg),
              AsyncSection<HomeBanner>(
                value: ref.watch(homeBannersProvider),
                skeleton: const SkeletonShimmer(
                  child: ClipRRect(
                    borderRadius: BannerCarousel.radius,
                    child: SkeletonBox(
                      height: BannerCarousel.height,
                      radius: 0,
                    ),
                  ),
                ),
                builder: (banners) => BannerCarousel(banners: banners),
                onRetry: () => ref.invalidate(homeBannersProvider),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refresh(BuildContext context, WidgetRef ref) async {
    final result = await ref.read(homeRepositoryProvider).refresh();
    if (result is Err && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.refreshFailed)));
    }
  }
}
