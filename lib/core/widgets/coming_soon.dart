import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';

void showComingSoon(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          context.l10n.comingSoon,
          style: const TextStyle(color: AppColors.ink),
        ),
        backgroundColor: AppColors.blushTop,
      ),
    );
}
