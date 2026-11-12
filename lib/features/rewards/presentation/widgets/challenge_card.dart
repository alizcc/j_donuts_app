import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/entrance.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/challenge_artwork.dart';
import 'package:j_donuts_app/features/rewards/presentation/widgets/earn_button.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({required this.challenge, super.key});

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadii.xl),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          spacing: AppSpacing.lg,
          children: [
            ChallengeArtwork(challenge: challenge),
            Expanded(child: _buildDetails(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.sm,
      children: [
        Text(challenge.title, style: AppTypography.title),
        Text(
          l10n.challengeCount(challenge.progress, challenge.goal),
          style: AppTypography.body,
        ),
        Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.sm,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            EarnButton(isActive: challenge.isComplete),
            Text(
              l10n.challengePoints(challenge.points),
              style: AppTypography.body,
            ),
          ],
        ),
      ],
    );
  }
}

class ChallengeList extends StatelessWidget {
  const ChallengeList({required this.challenges, super.key});

  final List<Challenge> challenges;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.lg,
      children: [
        for (final (index, challenge) in challenges.indexed)
          Entrance(
            delay: AppMotion.stagger * index,
            child: ChallengeCard(challenge: challenge),
          ),
      ],
    );
  }
}
