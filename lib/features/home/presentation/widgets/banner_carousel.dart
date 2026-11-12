import 'dart:async';

import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/badge_pill.dart';
import 'package:j_donuts_app/features/home/domain/home_banner.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({required this.banners, super.key});

  static const double height = 165;

  static const BorderRadius radius = BorderRadius.vertical(
    top: Radius.circular(AppRadii.lg),
  );

  final List<HomeBanner> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  static const double _viewportFraction = 0.78;

  final PageController _controller = PageController(
    viewportFraction: _viewportFraction,
  );
  Timer? _autoPlay;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _autoPlay?.cancel();
    _autoPlay = context.reduceMotion
        ? null
        : Timer.periodic(AppMotion.carouselInterval, (_) => _showNext());
  }

  @override
  void dispose() {
    _autoPlay?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _showNext() {
    if (!_controller.hasClients || widget.banners.length < 2) return;
    final current = _controller.page?.round() ?? 0;
    _controller.animateToPage(
      (current + 1) % widget.banners.length,
      duration: AppMotion.slow,
      curve: AppMotion.standard,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: BannerCarousel.height,
      child: PageView.builder(
        controller: _controller,
        padEnds: false,
        itemCount: widget.banners.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: AppSpacing.md),
          child: _BannerCard(banner: widget.banners[index]),
        ),
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  const _BannerCard({required this.banner});

  final HomeBanner banner;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.swatch(banner.color),
        borderRadius: BannerCarousel.radius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            BadgePill(label: banner.tag),
            const SizedBox(height: AppSpacing.sm),
            Text(
              banner.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.title.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
