enum PhoneError { empty, invalid }

const String myanmarCountryCode = '+95';

final RegExp _localMobileNumber = RegExp(r'^9\d{7,9}$');
final RegExp _separators = RegExp(r'[\s-]');

// 09254135592 -> +959254135592
String? normalizeMyanmarPhone(String input) {
  var digits = input.replaceAll(_separators, '');
  if (digits.startsWith('0')) digits = digits.substring(1);
  if (!_localMobileNumber.hasMatch(digits)) return null;
  return '$myanmarCountryCode$digits';
}

PhoneError? validatePhone(String input) {
  if (input.trim().isEmpty) return PhoneError.empty;
  if (normalizeMyanmarPhone(input) == null) return PhoneError.invalid;
  return null;
}
