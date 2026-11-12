import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/core/widgets/primary_button.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_controller.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_state.dart';
import 'package:j_donuts_app/features/auth/presentation/screens/phone_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock_auth_repository.dart';
import 'pump_auth_screen.dart';

void main() {
  const validNumber = '09254135592';

  Future<void> enterPhone(WidgetTester tester, String text) async {
    await tester.enterText(find.byType(TextField), text);
    await tester.pump();
  }

  Future<void> leaveField(WidgetTester tester) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump();
  }

  testWidgets('accepts a full phone number typed digit by digit', (
    tester,
  ) async {
    final container = await pumpAuthScreen(tester, const PhoneScreen());

    for (var i = 1; i <= validNumber.length; i++) {
      await enterPhone(tester, validNumber.substring(0, i));
    }

    expect(find.text(validNumber), findsOneWidget);
    expect(container.read(authFlowControllerProvider).phoneInput, validNumber);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('keeps Continue disabled for a number that is too short', (
    tester,
  ) async {
    final container = await pumpAuthScreen(tester, const PhoneScreen());

    await enterPhone(tester, '0925');

    expect(isContinueEnabled(tester), isFalse);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('enables Continue for a valid Myanmar number', (tester) async {
    final container = await pumpAuthScreen(tester, const PhoneScreen());

    await enterPhone(tester, validNumber);

    expect(isContinueEnabled(tester), isTrue);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('shows the invalid-number error after leaving the field', (
    tester,
  ) async {
    final container = await pumpAuthScreen(tester, const PhoneScreen());

    await enterPhone(tester, '0925');
    expect(find.text(l10n.phoneErrorInvalid), findsNothing);
    await leaveField(tester);

    expect(find.text(l10n.phoneErrorInvalid), findsOneWidget);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('shows the empty-number error after leaving an empty field', (
    tester,
  ) async {
    final container = await pumpAuthScreen(tester, const PhoneScreen());

    await leaveField(tester);

    expect(
      find.descendant(
        of: find.byType(TextField),
        matching: find.text(l10n.phoneErrorEmpty),
      ),
      findsOneWidget,
    );
    await disposeAuthScreen(tester, container);
  });

  testWidgets('on login, tells an unregistered number to register', (
    tester,
  ) async {
    final repository = MockAuthRepository();
    when(
      () => repository.isRegistered(any()),
    ).thenAnswer((_) async => const Success(false));
    final container = await pumpAuthScreen(
      tester,
      const PhoneScreen(),
      repository: repository,
      setUp: (flow) => flow.start(AuthMode.login),
    );

    await enterPhone(tester, validNumber);
    await tester.tap(find.byType(PrimaryButton));
    await tester.pumpAndSettle();

    expect(find.text(l10n.phoneNotRegistered), findsOneWidget);
    expect(find.widgetWithText(TextButton, l10n.registerLink), findsOneWidget);
    verifyNever(() => repository.sendOtp(any()));
    await disposeAuthScreen(tester, container);
  });
}
