import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/coming_soon.dart';
import 'package:j_donuts_app/core/widgets/entrance.dart';
import 'package:j_donuts_app/core/widgets/primary_button.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_controller.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_state.dart';
import 'package:j_donuts_app/features/auth/presentation/widgets/terms_footer.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  static const String _backgroundAsset = 'assets/images/onboarding.jpg';
  static const double _photoFadeHeight = 120;
  static const double _contentPadding = 32;
  static const double _loginSize = 15;
  static const double _socialIconSize = 24;
  static const double _socialGap = 47;
  static const List<String> _socialIcons = [
    'assets/icons/google.svg',
    'assets/icons/apple.svg',
    'assets/icons/facebook.svg',
  ];

  static Duration _stagger(int index) =>
      AppMotion.slow + AppMotion.stagger * index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ColoredBox(
        color: AppColors.blushBottom,
        child: Column(
          children: [
            Expanded(child: _buildPhoto()),
            SafeArea(top: false, child: _buildContent(context, ref)),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoto() {
    return Entrance(
      offset: const Offset(0, -0.05),
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
                    colors: [AppColors.transparent, AppColors.blushBottom],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _contentPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppSpacing.xxl),
          Entrance(
            delay: _stagger(0),
            child: Text(
              l10n.onboardingTitle,
              style: AppTypography.headline,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.xxxl),
          Entrance(
            delay: _stagger(1),
            child: PrimaryButton(
              label: l10n.letsGetStarted,
              onPressed: () => _start(context, ref, AuthMode.register),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Entrance(delay: _stagger(2), child: _buildLoginRow(context, ref)),
          const SizedBox(height: AppSpacing.xxxl),
          Entrance(delay: _stagger(3), child: _buildSocialRow(context)),
          const SizedBox(height: AppSpacing.xxxl),
          Entrance(delay: _stagger(4), child: const TermsFooter()),
          const SizedBox(height: AppSpacing.sm),
        ],
      ),
    );
  }

  Widget _buildLoginRow(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final style = AppTypography.body.copyWith(fontSize: _loginSize);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(l10n.alreadyHaveAccount, style: style),
        const SizedBox(width: AppSpacing.xs),
        GestureDetector(
          onTap: () => _start(context, ref, AuthMode.login),
          child: Text(
            l10n.logIn,
            style: style.copyWith(
              color: AppColors.pink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: _socialGap,
      children: [
        for (final icon in _socialIcons)
          GestureDetector(
            onTap: () => showComingSoon(context),
            child: SvgPicture.asset(
              icon,
              width: _socialIconSize,
              height: _socialIconSize,
            ),
          ),
      ],
    );
  }

  Future<void> _start(
    BuildContext context,
    WidgetRef ref,
    AuthMode mode,
  ) async {
    ref.read(authFlowControllerProvider.notifier).start(mode);
    await context.push(
      mode == AuthMode.login ? AppRoutes.loginPhone : AppRoutes.registerPhone,
    );
  }
}
