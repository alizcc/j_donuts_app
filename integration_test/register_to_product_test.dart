import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:j_donuts_app/app/app.dart';
import 'package:j_donuts_app/core/database/app_database.dart';
import 'package:j_donuts_app/core/database/database_provider.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/motion/app_motion.dart';
import 'package:j_donuts_app/features/auth/data/auth_providers.dart';
import 'package:pinput/pinput.dart';

final AppLocalizations l10n = lookupAppLocalizations(const Locale('en'));

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('registers a new user, lands on Home and opens a product', (
    tester,
  ) async {
    final container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(
          AppDatabase(NativeDatabase.memory()),
        ),
      ],
    );
    addTearDown(container.dispose);
    await container.read(sessionStorageProvider).clear();

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const App()),
    );

    await _tap(tester, find.text(l10n.letsGetStarted.toUpperCase()));
    await _enter(tester, find.byType(TextField), '09254135592');
    await _tap(tester, find.text(l10n.continueAction.toUpperCase()));

    await _openStep(tester, l10n.otpTitle);
    await _enter(tester, find.byType(Pinput), '123456');

    await _openStep(tester, l10n.nameTitle);
    await _enter(tester, find.byType(TextField).first, 'Ye Min');
    await _tap(tester, find.text(l10n.continueAction.toUpperCase()));

    await _openStep(tester, l10n.dobTitle);
    await _tap(tester, find.byType(DropdownButtonFormField<int>));
    await _tap(tester, find.text('May').last);
    await _enter(tester, find.byType(TextField).at(0), '1');
    await _enter(tester, find.byType(TextField).at(1), '1980');
    await _tap(tester, find.text(l10n.continueAction.toUpperCase()));

    await _openStep(tester, l10n.welcomeTitle);
    await _tap(tester, find.text(l10n.letsExplore.toUpperCase()));

    await _waitFor(tester, find.text('Ye Min'));
    await tester.pump(AppMotion.entrance * 2);
    await _tap(tester, find.text('Coconut Donut').first);

    await _waitFor(tester, find.text('JD022123'));
    expect(find.text('3,200 MMK'), findsWidgets);
  });
}

// pumpAndSettle hangs on shimmer and timers
Future<void> _waitFor(WidgetTester tester, Finder finder) async {
  const step = Duration(milliseconds: 100);
  const maxSteps = 100;
  for (var i = 0; i < maxSteps && finder.evaluate().isEmpty; i++) {
    await tester.pump(step);
  }
  expect(finder, findsWidgets);
}

// wait for the page transition to finish
Future<void> _openStep(WidgetTester tester, String title) async {
  await _waitFor(tester, find.text(title));
  await tester.pump(AppMotion.pageTransition * 2);
}

Future<void> _tap(WidgetTester tester, Finder finder) async {
  await _waitFor(tester, finder);
  await tester.ensureVisible(finder.first);
  await tester.tap(finder.first);
  await tester.pump();
}

Future<void> _enter(WidgetTester tester, Finder finder, String text) async {
  await _waitFor(tester, finder);
  await tester.enterText(finder, text);
  await tester.pump();
}
