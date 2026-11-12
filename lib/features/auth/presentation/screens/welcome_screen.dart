import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/entrance.dart';
import 'package:j_donuts_app/core/widgets/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String _backgroundAsset = 'assets/images/welcome.jpeg';
  static const double _photoFadeHeight = 160;
  static const double _contentPadding = 32;

  static Duration _stagger(int index) =>
      AppMotion.slow + AppMotion.stagger * index;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: ColoredBox(
        color: AppColors.blushTop,
        child: Column(
          children: [
            Expanded(child: _buildPhoto()),
            SafeArea(
              top: false,
              minimum: const EdgeInsets.only(bottom: AppSpacing.xxxl),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: _contentPadding,
                ),
                child: Column(
                  children: [
                    Entrance(
                      delay: _stagger(1),
                      offset: const Offset(0, 0.3),
                      child: Text(
                        l10n.welcomeTitle,
                        style: AppTypography.headline,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxxl),
                    Entrance(
                      delay: _stagger(2),
                      child: PrimaryButton(
                        label: l10n.letsExplore,
                        onPressed: () => context.go(AppRoutes.home),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoto() {
    return Entrance(
      offset: const Offset(0, -0.1),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(_backgroundAsset, fit: BoxFit.cover),
          const Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: _photoFadeHeight,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.transparent, AppColors.blushTop],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
