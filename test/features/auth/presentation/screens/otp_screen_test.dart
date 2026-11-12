import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/otp_state.dart';
import 'package:j_donuts_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock_auth_repository.dart';
import 'pump_auth_screen.dart';

void main() {
  late MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    when(
      () => repository.verifyOtp(
        phone: any(named: 'phone'),
        code: any(named: 'code'),
      ),
    ).thenAnswer((_) async => const Success(false));
  });

  Future<void> enterCode(WidgetTester tester, String code) async {
    await tester.enterText(find.byType(EditableText), code);
    await tester.pumpAndSettle();
  }

  testWidgets('opens without errors and shows the resend countdown', (
    tester,
  ) async {
    final container = await pumpAuthScreen(
      tester,
      const OtpScreen(),
      repository: repository,
      setUp: (flow) => flow.setPhone('09254135592'),
    );
    await tester.pump(const Duration(seconds: 1));

    expect(tester.takeException(), isNull);
    expect(find.textContaining('4:59'), findsOneWidget);
    await disposeAuthScreen(tester, container);
  });

  testWidgets('shows attempts left after a wrong code', (tester) async {
    final container = await pumpAuthScreen(
      tester,
      const OtpScreen(),
      repository: repository,
      setUp: (flow) => flow.setPhone('09254135592'),
    );

    await enterCode(tester, '000000');

    expect(
      find.text(l10n.otpWrongCode(OtpState.maxWrongAttempts - 1)),
      findsOneWidget,
    );
    await disposeAuthScreen(tester, container);
  });

  testWidgets('locks the code input after three wrong codes', (tester) async {
    final container = await pumpAuthScreen(
      tester,
      const OtpScreen(),
      repository: repository,
      setUp: (flow) => flow.setPhone('09254135592'),
    );

    for (var i = 0; i < OtpState.maxWrongAttempts; i++) {
      await enterCode(tester, '000000');
    }

    expect(find.text(l10n.otpLocked), findsOneWidget);
    await disposeAuthScreen(tester, container);
  });
}
