enum NameError { empty, tooLong, invalidCharacters }

const int maxNameLength = 50;

// \p{M}: Myanmar vowel signs are combining marks.
final RegExp _lettersAndSpaces = RegExp(r'^[\p{L}\p{M} ]+$', unicode: true);

NameError? validateName(String input, {required bool isRequired}) {
  final name = input.trim();
  if (name.isEmpty) return isRequired ? NameError.empty : null;
  if (name.length > maxNameLength) return NameError.tooLong;
  if (!_lettersAndSpaces.hasMatch(name)) return NameError.invalidCharacters;
  return null;
}
