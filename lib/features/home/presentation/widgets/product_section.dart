import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/coming_soon.dart';
import 'package:j_donuts_app/core/widgets/skeleton.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:j_donuts_app/features/home/presentation/home_section_providers.dart';
import 'package:j_donuts_app/features/home/presentation/widgets/async_section.dart';
import 'package:j_donuts_app/features/home/presentation/widgets/product_tile.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';

class ProductSection extends ConsumerWidget {
  const ProductSection({required this.section, super.key});

  static const double _labelHeight = 48;
  static const double _arrowSize = 28;
  static const int _skeletonCount = 3;

  final HomeSection section;

  (double width, double imageHeight) get _tileSize => switch (section) {
    HomeSection.seasonal => (240, 160),
    HomeSection.popular => (160, 236),
    HomeSection.orderAgain => (160, 160),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textScaler = MediaQuery.textScalerOf(context);
    final listHeight =
        _tileSize.$2 + AppSpacing.sm + textScaler.scale(_labelHeight);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.screenGutter),
          child: _buildHeader(context),
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: listHeight,
          child: AsyncSection<Product>(
            value: ref.watch(homeSectionProvider(section)),
            skeleton: _buildSkeleton(),
            builder: _buildList,
            onRetry: () => ref.invalidate(homeSectionProvider(section)),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final l10n = context.l10n;
    final title = switch (section) {
      HomeSection.seasonal => l10n.sectionSeasonal,
      HomeSection.popular => l10n.sectionPopular,
      HomeSection.orderAgain => l10n.sectionOrderAgain,
    };
    return Row(
      children: [
        Expanded(child: Text(title, style: AppTypography.title)),
        SizedBox.square(
          dimension: _arrowSize,
          child: IconButton.filled(
            tooltip: l10n.seeAllTooltip,
            padding: EdgeInsets.zero,
            iconSize: AppSpacing.xl,
            style: IconButton.styleFrom(backgroundColor: AppColors.white),
            onPressed: () => showComingSoon(context),
            icon: const Icon(Icons.chevron_right, color: AppColors.ink),
          ),
        ),
      ],
    );
  }

  Widget _buildList(List<Product> products) {
    final (width, imageHeight) = _tileSize;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      itemCount: products.length,
      separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
      itemBuilder: (context, index) => ProductTile(
        product: products[index],
        heroTag: '${section.name}-${products[index].id}',
        width: width,
        imageHeight: imageHeight,
      ),
    );
  }

  Widget _buildSkeleton() {
    final (width, imageHeight) = _tileSize;
    return SkeletonShimmer(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _skeletonCount,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
        itemBuilder: (_, _) => Align(
          alignment: Alignment.topCenter,
          child: SkeletonBox(width: width, height: imageHeight),
        ),
      ),
    );
  }
}
