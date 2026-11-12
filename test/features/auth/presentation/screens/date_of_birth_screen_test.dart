import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/features/auth/domain/validators/date_of_birth_validator.dart';
import 'package:j_donuts_app/features/auth/presentation/screens/date_of_birth_screen.dart';

import 'pump_auth_screen.dart';

void main() {
  final thisYear = DateTime.now().year;

  Future<void> enterDayAndYear(
    WidgetTester tester, {
    required int day,
    required int year,
  }) async {
    await tester.enterText(find.byType(TextField).at(0), '$day');
    await tester.enterText(find.byType(TextField).at(1), '$year');
    await tester.pump();
  }

  testWidgets('keeps Continue disabled until the date is complete', (
    tester,
  ) async {
    final container = await pumpAuthScreen(
      tester,
      const DateOfBirthScreen(),
      setUp: (flow) => flow.setBirthMonth(5),
    );

    await tester.enterText(find.byType(TextField).at(0), '1');
    await tester.pump();
    expect(isContinueEnabled(tester), isFalse);

    await tester.enterText(find.byType(TextField).at(1), '1990');
    await tester.pump();
    expect(isContinueEnabled(tester), isTrue);
    await disposeAuthScreen(tester, container);
  });

  testWidgets("rejects 31 April as a date that doesn't exist", (tester) async {
    final container = await pumpAuthScreen(
      tester,
      const DateOfBirthScreen(),
      setUp: (flow) => flow.setBirthMonth(4),
    );

    await enterDayAndYear(tester, day: 31, year: 1990);

    expect(find.text(l10n.dobErrorInvalid), findsOneWidget);
    expect(isContinueEnabled(tester), isFalse);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('rejects a date of birth in the future', (tester) async {
    final container = await pumpAuthScreen(
      tester,
      const DateOfBirthScreen(),
      setUp: (flow) => flow.setBirthMonth(1),
    );

    await enterDayAndYear(tester, day: 1, year: thisYear + 1);

    expect(find.text(l10n.dobErrorFuture), findsOneWidget);
    expect(isContinueEnabled(tester), isFalse);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('rejects someone younger than 13', (tester) async {
    final container = await pumpAuthScreen(
      tester,
      const DateOfBirthScreen(),
      setUp: (flow) => flow.setBirthMonth(1),
    );

    await enterDayAndYear(tester, day: 1, year: thisYear - minimumAge + 1);

    expect(find.text(l10n.dobErrorTooYoung(minimumAge)), findsOneWidget);
    expect(isContinueEnabled(tester), isFalse);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('enables Continue for a valid adult date', (tester) async {
    final container = await pumpAuthScreen(
      tester,
      const DateOfBirthScreen(),
      setUp: (flow) => flow.setBirthMonth(5),
    );

    await enterDayAndYear(tester, day: 1, year: 1990);

    expect(find.text(l10n.dobErrorInvalid), findsNothing);
    expect(isContinueEnabled(tester), isTrue);
    await disposeAuthScreen(tester, container);
  });
}
