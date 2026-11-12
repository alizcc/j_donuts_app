import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/core/motion/motion_scale.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';

// Gives every Home section its own loading, empty and error state.
class AsyncSection<T> extends StatelessWidget {
  const AsyncSection({
    required this.value,
    required this.skeleton,
    required this.builder,
    required this.onRetry,
    super.key,
  });

  final AsyncValue<List<T>> value;
  final Widget skeleton;
  final Widget Function(List<T> items) builder;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AnimatedSwitcher(
      duration: context.motion(AppMotion.medium),
      child: switch (value) {
        AsyncData(:final value) when value.isEmpty => SectionMessage(
          message: l10n.sectionEmpty,
        ),
        AsyncData(:final value) => builder(value),
        AsyncError() => SectionMessage(
          message: l10n.sectionError,
          onRetry: onRetry,
        ),
        _ => skeleton,
      },
    );
  }
}

class SectionMessage extends StatelessWidget {
  const SectionMessage({required this.message, this.onRetry, super.key});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Row(
        children: [
          Expanded(child: Text(message, style: AppTypography.bodySmall)),
          if (onRetry != null)
            TextButton(
              onPressed: onRetry,
              child: Text(context.l10n.retryAction),
            ),
        ],
      ),
    );
  }
}
