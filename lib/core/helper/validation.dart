import '../constants/app_text.dart';

enum InputType { name, email, password, confirmidPassword, phonNumber }

class Validation {
  static String? validateInput(InputType inputType, String? value) {
    switch (inputType) {
      case InputType.name:
        return _validateFullName(value);
      case InputType.email:
        return _validateEmail(value);
      case InputType.password:
        return _validatePassword(value);
      case InputType.confirmidPassword:
        return _validatePassword(value);
      default:
        return null;
    }
  }

  static String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return AppTexts.nameRequired;
    }
    if (!RegExp(r'^[\u0621-\u064A\u0660-\u0669A-Za-z\s]+$').hasMatch(value)) {
      return AppTexts.nameInvalid;
    }
    if (value.length < 8) {
      return AppTexts.nameTooShort;
    }
    return null;
  }

  static String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppTexts.emailRequired;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return AppTexts.emailInvalid;
    }
    return null;
  }

  static String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppTexts.passwordRequired;
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
      return AppTexts.passwordInvalid;
    }
    return null;
  }
}
