import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/features/auth/domain/validators/name_validator.dart';

void main() {
  NameError? first(String input) => validateName(input, isRequired: true);
  NameError? last(String input) => validateName(input, isRequired: false);

  group('validateName for first name', () {
    test('requires a value', () {
      expect(first(''), NameError.empty);
    });

    test('treats only spaces as empty', () {
      expect(first('   '), NameError.empty);
    });

    test('accepts a single letter', () {
      expect(first('A'), isNull);
    });

    test('accepts letters with spaces', () {
      expect(first('Ye Min'), isNull);
    });

    test('accepts Myanmar script', () {
      expect(first('ရဲမင်း'), isNull);
    });

    test('accepts 50 characters', () {
      expect(first('a' * maxNameLength), isNull);
    });

    test('rejects 51 characters', () {
      expect(first('a' * (maxNameLength + 1)), NameError.tooLong);
    });

    test('measures length after trimming', () {
      expect(first('  ${'a' * maxNameLength}  '), isNull);
    });

    test('rejects digits', () {
      expect(first('Ye Min 2'), NameError.invalidCharacters);
    });

    test('rejects Myanmar digits', () {
      expect(first('ရဲမင်း၂'), NameError.invalidCharacters);
    });

    test('rejects symbols', () {
      expect(first('Ye@Min'), NameError.invalidCharacters);
    });
  });

  group('validateName for last name', () {
    test('may be left empty', () {
      expect(last(''), isNull);
    });

    test('uses the same character rules', () {
      expect(last('Phyoe Win'), isNull);
      expect(last('Win1'), NameError.invalidCharacters);
      expect(last('a' * (maxNameLength + 1)), NameError.tooLong);
    });
  });
}
