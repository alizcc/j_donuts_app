import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/features/auth/domain/validators/name_validator.dart';
import 'package:j_donuts_app/features/auth/presentation/screens/name_screen.dart';

import 'pump_auth_screen.dart';

void main() {
  Finder firstNameField() => find.byType(TextField).at(0);

  Future<void> enterFirstName(WidgetTester tester, String text) async {
    await tester.enterText(firstNameField(), text);
    await tester.pump();
  }

  testWidgets('keeps Continue disabled until a first name is entered', (
    tester,
  ) async {
    final container = await pumpAuthScreen(tester, const NameScreen());

    expect(isContinueEnabled(tester), isFalse);
    await enterFirstName(tester, 'Phyo');
    expect(isContinueEnabled(tester), isTrue);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('shows an error when the first name contains digits', (
    tester,
  ) async {
    final container = await pumpAuthScreen(tester, const NameScreen());

    await enterFirstName(tester, 'Phyo3');

    expect(find.text(l10n.nameErrorInvalid), findsOneWidget);
    expect(isContinueEnabled(tester), isFalse);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('shows an error when the first name is cleared', (tester) async {
    final container = await pumpAuthScreen(tester, const NameScreen());

    await enterFirstName(tester, 'Phyo');
    await enterFirstName(tester, '');

    expect(find.text(l10n.nameErrorEmpty), findsOneWidget);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('allows the last name to stay empty', (tester) async {
    final container = await pumpAuthScreen(tester, const NameScreen());

    await enterFirstName(tester, 'Phyo');

    expect(find.text(l10n.nameErrorEmpty), findsNothing);
    expect(isContinueEnabled(tester), isTrue);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('shows an error for a name longer than 50 characters', (
    tester,
  ) async {
    final container = await pumpAuthScreen(tester, const NameScreen());

    await enterFirstName(tester, 'a' * (maxNameLength + 1));

    expect(find.text(l10n.nameErrorTooLong(maxNameLength)), findsOneWidget);
    await disposeAuthScreen(tester, container);
  });
}
