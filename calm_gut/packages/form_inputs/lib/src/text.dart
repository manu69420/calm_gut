import 'package:formz/formz.dart';

enum TextValidationError {
  empty;

  String text() {
    if (this == TextValidationError.empty) return 'Text Field cannot be empty';
    return '';
  }
}

class Text extends FormzInput<String, TextValidationError> {
  const Text.pure() : super.pure('');
  const Text.dirty([String value = '']) : super.dirty(value);

  @override
  TextValidationError? validator(String value) {
    return value.isEmpty ? TextValidationError.empty : null;
  }
}
