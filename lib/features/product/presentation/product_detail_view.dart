import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/app_image.dart';
import 'package:j_donuts_app/core/widgets/badge_pill.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';
import 'package:j_donuts_app/features/product/presentation/widgets/add_to_cart_button.dart';
import 'package:j_donuts_app/features/product/presentation/widgets/quantity_stepper.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({required this.product, this.heroTag, super.key});

  final Product product;
  final String? heroTag;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  static const double _imageAspectRatio = 4 / 3;
  static const double _helpDotRadius = 9;
  static const double _helpIconSize = 14;
  static const double _dividerHeight = 64;
  static const double _stepperOverlap = 32;

  int _quantity = QuantityStepper.minQuantity;

  String _price(int amount) => context.l10n.priceMmk('$amount');

  void _addToCart() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            context.l10n.addedToCart(_quantity, widget.product.name),
            style: const TextStyle(color: AppColors.ink),
          ),
          backgroundColor: AppColors.blushTop,
        ),
      );
    context.canPop() ? context.pop() : context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenGutter,
            ),
            child: Column(
              children: [
                _buildCardWithStepper(),
                const SizedBox(height: AppSpacing.xxl),
                _buildDescription(),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.screenGutter),
          child: AddToCartButton(
            totalLabel: _price(_quantity * widget.product.priceMmk),
            onPressed: _addToCart,
          ),
        ),
      ],
    );
  }

  Widget _buildCardWithStepper() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: _stepperOverlap),
          child: _buildCard(),
        ),
        QuantityStepper(
          quantity: _quantity,
          onChanged: (value) => setState(() => _quantity = value),
        ),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg + _stepperOverlap,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadii.xl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleRow(),
          const SizedBox(height: AppSpacing.lg),
          AspectRatio(aspectRatio: _imageAspectRatio, child: _buildImage()),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    final product = widget.product;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.code, style: AppTypography.caption),
              Text(product.name, style: AppTypography.display),
              Text(_price(product.priceMmk), style: AppTypography.titleSmall),
            ],
          ),
        ),
        if (product.isNew) BadgePill(label: context.l10n.newBadge),
      ],
    );
  }

  Widget _buildImage() {
    final product = widget.product;
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(AppRadii.lg),
      child: AppImage(url: product.imageUrl, asset: product.imageAsset),
    );
    final heroTag = widget.heroTag;
    return heroTag == null ? image : Hero(tag: heroTag, child: image);
  }

  Widget _buildDescription() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const CircleAvatar(
              radius: _helpDotRadius,
              backgroundColor: AppColors.green,
              child: Icon(
                Icons.question_mark,
                size: _helpIconSize,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(context.l10n.whatsThis, style: AppTypography.label),
          ],
        ),
        Container(
          width: 1,
          height: _dividerHeight,
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          color: AppColors.greyTrack,
        ),
        Expanded(
          child: Text(
            widget.product.description,
            style: AppTypography.bodySmall,
          ),
        ),
      ],
    );
  }
}
