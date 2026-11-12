import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/widgets/skeleton.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    required this.url,
    this.asset,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String url;
  final String? asset;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      placeholder: (context, url) =>
          const SkeletonShimmer(child: SkeletonBox(radius: 0)),
      errorWidget: (context, url, error) => _fallback(),
    );
  }

  Widget _fallback() {
    final asset = this.asset;
    if (asset != null) return Image.asset(asset, fit: fit);
    return const ColoredBox(
      color: AppColors.greySurface,
      child: Center(
        child: Icon(Icons.broken_image_outlined, color: AppColors.inkSubtle),
      ),
    );
  }
}
