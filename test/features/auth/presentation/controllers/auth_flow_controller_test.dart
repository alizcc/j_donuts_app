import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/features/auth/data/auth_providers.dart';
import 'package:j_donuts_app/features/auth/domain/user.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_controller.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock_auth_repository.dart';

void main() {
  late MockAuthRepository repository;
  late ProviderContainer container;

  setUpAll(
    () => registerFallbackValue(
      User(phone: '', firstName: '', dateOfBirth: DateTime(1980)),
    ),
  );

  setUp(() {
    repository = MockAuthRepository();
    when(() => repository.register(any())).thenAnswer(
      (call) async => Success(call.positionalArguments.first as User),
    );
    container = ProviderContainer(
      overrides: [authRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);
  });

  Future<User> register({
    required String firstName,
    String lastName = '',
  }) async {
    final controller = container.read(authFlowControllerProvider.notifier)
      ..setPhone('09254135592')
      ..setFirstName(firstName)
      ..setLastName(lastName)
      ..setBirthMonth(5)
      ..setBirthDay(1)
      ..setBirthYear(1980);
    await controller.submitDateOfBirth();
    return verify(() => repository.register(captureAny())).captured.single
        as User;
  }

  group('submitDateOfBirth', () {
    test('trims both names before saving', () async {
      final saved = await register(
        firstName: '  Ye Min ',
        lastName: ' Phyoe Win  ',
      );

      expect(saved.firstName, 'Ye Min');
      expect(saved.lastName, 'Phyoe Win');
    });

    test('saves a blank last name as no last name', () async {
      final saved = await register(firstName: 'Ye Min', lastName: '   ');

      expect(saved.lastName, isNull);
    });
  });
}
