import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/app_image.dart';
import 'package:j_donuts_app/core/widgets/badge_pill.dart';
import 'package:j_donuts_app/core/widgets/pressable_scale.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    required this.product,
    required this.heroTag,
    required this.width,
    required this.imageHeight,
    super.key,
  });

  final Product product;
  final String heroTag;
  final double width;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return PressableScale(
      onTap: () =>
          context.push(AppRoutes.productDetail(product.id), extra: heroTag),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: imageHeight, child: _buildImage(context)),
            const SizedBox(height: AppSpacing.sm),
            Text(
              product.name,
              style: AppTypography.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final discount = product.discountPercent;
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: heroTag,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.lg),
            child: AppImage(url: product.imageUrl, asset: product.imageAsset),
          ),
        ),
        if (discount != null)
          Positioned(
            right: AppSpacing.sm,
            bottom: AppSpacing.sm,
            child: BadgePill(label: context.l10n.discountBadge(discount)),
          ),
      ],
    );
  }
}
