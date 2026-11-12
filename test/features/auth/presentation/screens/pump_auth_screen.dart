import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/theme/app_theme.dart';
import 'package:j_donuts_app/core/widgets/primary_button.dart';
import 'package:j_donuts_app/features/auth/data/auth_providers.dart';
import 'package:j_donuts_app/features/auth/domain/auth_repository.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_controller.dart';

import '../../mock_auth_repository.dart';

final AppLocalizations l10n = lookupAppLocalizations(const Locale('en'));

Future<ProviderContainer> pumpAuthScreen(
  WidgetTester tester,
  Widget screen, {
  AuthRepository? repository,
  void Function(AuthFlowController flow)? setUp,
}) async {
  final container = ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(
        repository ?? MockAuthRepository(),
      ),
    ],
  );
  setUp?.call(container.read(authFlowControllerProvider.notifier));
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        theme: AppTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: screen,
      ),
    ),
  );
  await tester.pump();
  return container;
}

// Unmount before disposing so screen timers (OTP countdown) are cancelled
// before the test ends.
Future<void> disposeAuthScreen(
  WidgetTester tester,
  ProviderContainer container,
) async {
  await tester.pumpWidget(const SizedBox());
  container.dispose();
}

bool isContinueEnabled(WidgetTester tester) =>
    tester.widget<PrimaryButton>(find.byType(PrimaryButton)).onPressed != null;
