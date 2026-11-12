import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/router/app_routes.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/primary_button.dart';
import 'package:j_donuts_app/core/widgets/step_progress_ring.dart';
import 'package:j_donuts_app/features/auth/presentation/widgets/terms_footer.dart';

class AuthStepScaffold extends StatelessWidget {
  const AuthStepScaffold({
    required this.step,
    required this.title,
    required this.body,
    this.subtitle,
    this.onContinue,
    this.showContinue = true,
    this.isLoading = false,
    super.key,
  });

  static const int totalSteps = 4;

  final int step;
  final String title;
  final String? subtitle;
  final Widget body;

  final VoidCallback? onContinue;
  final bool showContinue;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppColors.blushGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenGutter,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.lg),
                _buildTopBar(context),
                const SizedBox(height: AppSpacing.xxl),
                Expanded(child: SingleChildScrollView(child: _buildBody())),
                if (showContinue)
                  PrimaryButton(
                    label: context.l10n.continueAction,
                    onPressed: onContinue,
                    isLoading: isLoading,
                  ),
                const SizedBox(height: AppSpacing.xl),
                const TermsFooter(),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      children: [
        Material(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadii.sm),
          child: IconButton(
            tooltip: context.l10n.backTooltip,
            icon: const Icon(Icons.arrow_back, color: AppColors.ink),
            onPressed: () => _goBack(context),
          ),
        ),
        const Spacer(),
        StepProgressRing(step: step, totalSteps: totalSteps),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: AppTypography.headline),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(subtitle!, style: AppTypography.bodySmall),
        ],
        const SizedBox(height: AppSpacing.xxl),
        body,
      ],
    );
  }

  void _goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.onboarding);
    }
  }
}
