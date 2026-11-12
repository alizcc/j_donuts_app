import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/features/auth/domain/validators/date_of_birth_validator.dart';

void main() {
  final today = DateTime(2026, 11, 11);

  DateOfBirthError? validate(int? year, int? month, int? day) =>
      validateDateOfBirth(year: year, month: month, day: day, today: today);

  group('validateDateOfBirth', () {
    test('reports a missing part as incomplete', () {
      expect(validate(1980, null, 1), DateOfBirthError.incomplete);
    });

    test('accepts a normal date', () {
      expect(validate(1980, 5, 1), isNull);
    });

    test('rejects 31 April', () {
      expect(validate(1990, 4, 31), DateOfBirthError.invalidDate);
    });

    test('accepts 29 February in a leap year', () {
      expect(validate(2000, 2, 29), isNull);
    });

    test('rejects 29 February in a non-leap year', () {
      expect(validate(2001, 2, 29), DateOfBirthError.invalidDate);
    });

    test('rejects month 13', () {
      expect(validate(1990, 13, 1), DateOfBirthError.invalidDate);
    });

    test('rejects day 0', () {
      expect(validate(1990, 1, 0), DateOfBirthError.invalidDate);
    });

    test('rejects a date in the future', () {
      expect(validate(2027, 1, 1), DateOfBirthError.inFuture);
    });

    test('rejects someone who turns 13 tomorrow', () {
      expect(validate(2013, 11, 12), DateOfBirthError.tooYoung);
    });

    test('accepts someone who turns 13 today', () {
      expect(validate(2013, 11, 11), isNull);
    });

    test('uses 13 as the minimum age', () {
      expect(minimumAge, 13);
    });
  });
}
