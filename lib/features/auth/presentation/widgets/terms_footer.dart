import 'package:flutter/material.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/core/widgets/coming_soon.dart';

class TermsFooter extends StatelessWidget {
  const TermsFooter({super.key});

  static final TextStyle _style = AppTypography.caption.copyWith(
    fontSize: 13,
    height: 1.5,
    color: AppColors.inkSoft,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text.rich(
      TextSpan(
        style: _style,
        children: [
          TextSpan(text: '${l10n.termsPrefix} '),
          _link(context, l10n.termsOfUse),
          TextSpan(text: ' ${l10n.termsAnd} '),
          _link(context, '${l10n.privacyPolicy}.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  InlineSpan _link(BuildContext context, String text) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.baseline,
      baseline: TextBaseline.alphabetic,
      child: GestureDetector(
        onTap: () => showComingSoon(context),
        child: Text(text, style: _style.copyWith(color: AppColors.pink)),
      ),
    );
  }
}
