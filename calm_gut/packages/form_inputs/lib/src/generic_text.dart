import 'package:formz/formz.dart';

enum TextValidationError {
  empty;

  String text() {
    if (this == TextValidationError.empty) return 'Text Field cannot be empty';
    return '';
  }
}

class GenericText extends FormzInput<String, TextValidationError> {
  const GenericText.pure() : super.pure('');
  const GenericText.dirty([String value = '']) : super.dirty(value);

  @override
  TextValidationError? validator(String value) {
    return value.isEmpty ? TextValidationError.empty : null;
  }
}
