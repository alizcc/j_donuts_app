enum DateOfBirthError { incomplete, invalidDate, inFuture, tooYoung }

const int minimumAge = 13;

DateOfBirthError? validateDateOfBirth({
  required int? year,
  required int? month,
  required int? day,
  required DateTime today,
}) {
  if (year == null || month == null || day == null) {
    return DateOfBirthError.incomplete;
  }
  final date = DateTime(year, month, day); 
  // if date is 31Apr, it will be 1stMay
  if (date.year != year || date.month != month || date.day != day) {
    return DateOfBirthError.invalidDate;
  }
  final todayDate = DateTime(today.year, today.month, today.day);
  if (date.isAfter(todayDate)) return DateOfBirthError.inFuture;
  final minimumAgeBirthday = DateTime(year + minimumAge, month, day);
  if (minimumAgeBirthday.isAfter(todayDate)) return DateOfBirthError.tooYoung;
  return null;
}
