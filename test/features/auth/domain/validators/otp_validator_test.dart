import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/features/auth/domain/validators/otp_validator.dart';

void main() {
  group('isCompleteOtp', () {
    test('accepts exactly six digits', () {
      expect(isCompleteOtp('123456'), isTrue);
    });

    test('rejects fewer than six digits', () {
      expect(isCompleteOtp('12345'), isFalse);
    });

    test('rejects more than six digits', () {
      expect(isCompleteOtp('1234567'), isFalse);
    });

    test('rejects non-digit characters', () {
      expect(isCompleteOtp('12a456'), isFalse);
    });
  });
}
