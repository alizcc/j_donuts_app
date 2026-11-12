import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/skeleton.dart';
import 'package:j_donuts_app/features/home/domain/shop.dart';
import 'package:j_donuts_app/features/home/presentation/home_section_providers.dart';
import 'package:j_donuts_app/features/home/presentation/widgets/async_section.dart';

class ShopsSection extends ConsumerWidget {
  const ShopsSection({super.key});

  static const double _cardWidth = 200;
  static const double _photoHeight = 100;
  static const double _textHeight = 120;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shops = ref.watch(nearbyShopsProvider);
    final listHeight =
        _photoHeight + MediaQuery.textScalerOf(context).scale(_textHeight);
    return ColoredBox(
      color: AppColors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenGutter),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.shopsTitle(shops.value?.length ?? 0),
              style: AppTypography.title.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: AppSpacing.md),
            _buildExploreNow(context),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: listHeight,
              child: AsyncSection<Shop>(
                value: shops,
                skeleton: const SkeletonShimmer(
                  child: SkeletonBox(width: _cardWidth),
                ),
                builder: _buildList,
                onRetry: () => ref.invalidate(nearbyShopsProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreNow(BuildContext context) {
    return DecoratedBox(
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        child: Text(
          context.l10n.exploreNow.toUpperCase(),
          style: AppTypography.label.copyWith(color: AppColors.cyan),
        ),
      ),
    );
  }

  Widget _buildList(List<Shop> shops) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      itemCount: shops.length,
      separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
      itemBuilder: (context, index) => _ShopCard(shop: shops[index]),
    );
  }
}

class _ShopCard extends StatelessWidget {
  const _ShopCard({required this.shop});

  static const double _iconSize = 40;

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ShopsSection._cardWidth,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: ShopsSection._photoHeight - AppSpacing.sm,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.swatch(shop.color),
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            child: const Icon(
              Icons.storefront,
              size: _iconSize,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(shop.name, style: AppTypography.titleSmall, maxLines: 1),
          Text(
            shop.address,
            style: AppTypography.caption.copyWith(color: AppColors.inkMuted),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Text(
            context.l10n.orderOnline,
            style: AppTypography.label.copyWith(color: AppColors.pink),
          ),
        ],
      ),
    );
  }
}
