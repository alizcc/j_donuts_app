const int otpLength = 6;

final RegExp _sixDigits = RegExp(r'^\d{6}$');

bool isCompleteOtp(String code) => _sixDigits.hasMatch(code);
