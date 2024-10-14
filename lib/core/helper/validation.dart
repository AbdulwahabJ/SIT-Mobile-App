import 'package:flutter/material.dart';
import 'package:sit_app/generated/l10n.dart';

enum InputType { name, email, password, confirmPassword, phoneNumber }

class Validation {
  static String? validateInput(
      InputType inputType, String? value, BuildContext context) {
    switch (inputType) {
      case InputType.name:
        return _validateFullName(value, context);
      case InputType.email:
        return _validateEmail(value, context);
      case InputType.password:
        return _validatePassword(value, context);
      case InputType.confirmPassword:
        return _validateConfirmPassword(value, context);
      case InputType.phoneNumber:
        return _validatePhoneNumber(value, context);
      default:
        return null;
    }
  }

  static String? _validateFullName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).nameRequired;
    }
    if (!RegExp(r'^[\u0621-\u064A\u0660-\u0669A-Za-z\s]+$').hasMatch(value)) {
      return S.of(context).nameInvalid;
    }
    if (value.length < 3) {
      return S.of(context).nameTooShort;
    }
    return null;
  }

  static String? _validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).emailRequired;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return S.of(context).emailInvalid;
    }
    return null;
  }

  static String? _validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordRequired;
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
      return S.of(context).passwordInvalid;
    }
    return null;
  }

  static String? _validateConfirmPassword(String? value, BuildContext context) {
    // Assuming you want to compare with a previously entered password.
    return null;
  }

  static String? _validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).phoneNumberRequired; // الرسالة باللغة المطلوبة
    }
    if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
      return S.of(context).phoneNumberInvalid; // الرسالة باللغة المطلوبة
    }
    return null;
  }
}
