import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/network/network_providers.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/offline_banner.dart';
import 'package:j_donuts_app/core/widgets/skeleton.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';
import 'package:j_donuts_app/features/product/presentation/product_detail_view.dart';
import 'package:j_donuts_app/features/product/presentation/product_provider.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({required this.productId, this.heroTag, super.key});

  static const double _skeletonHeight = 360;

  final String productId;
  final String? heroTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isOffline = ref.watch(isOnlineProvider).value == false;
    return Scaffold(
      backgroundColor: AppColors.greySurface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBackButton(context),
            const SizedBox(height: AppSpacing.lg),
            Expanded(
              child: switch (ref.watch(productProvider(productId))) {
                AsyncData(value: final Product product) => ProductDetailView(
                  product: product,
                  heroTag: heroTag,
                ),
                AsyncData() => _buildMessage(l10n.productNotFound),
                AsyncError() => _buildMessage(l10n.productError),
                _ => const Padding(
                  padding: EdgeInsets.all(AppSpacing.screenGutter),
                  child: SkeletonShimmer(
                    child: SkeletonBox(height: _skeletonHeight),
                  ),
                ),
              },
            ),
            OfflineBanner(isOffline: isOffline),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: IconButton(
        tooltip: context.l10n.backTooltip,
        icon: const Icon(Icons.arrow_back, color: AppColors.ink),
        onPressed: () =>
            context.canPop() ? context.pop() : context.go(AppRoutes.home),
      ),
    );
  }

  Widget _buildMessage(String message) {
    return Center(
      child: Text(
        message,
        style: AppTypography.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
