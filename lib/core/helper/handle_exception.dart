import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/helper/language.dart';

Future<T> handleException<T>(Future<T> Function() action) async {
  try {
    return await action();
  } on SocketException {
    throw Exception(isArabic()
        ? AppTexts.noInternetException_ar
        : AppTexts.noInternetException);
  } on TimeoutException {
    throw Exception(
        isArabic() ? AppTexts.timeOutException_ar : AppTexts.timeOutException);
  } catch (e) {
    if (e is DioException &&
        e.response?.data['message'] == 'Invalid email' &&
        e.response?.statusCode == 401) {
      throw (isArabic()
          ? AppTexts.dontHaveAccountException_ar
          : AppTexts.dontHaveAccountException);
    } else if (e is DioException &&
        e.response?.data['message'] == 'Invalid password' &&
        e.response?.statusCode == 401) {
      throw (isArabic()
          ? AppTexts.wrongPasswordException_ar
          : AppTexts.wrongPasswordException);
    } else if (e is DioException &&
        e.response?.data['message'] == 'email not exist' &&
        e.response?.statusCode == 404) {
      throw (isArabic()
          ? AppTexts.verfiyEmailException_ar
          : AppTexts.verfiyEmailException);
    } else if (e is DioException &&
        e.response?.data['message'] == 'unique email' &&
        e.response?.statusCode == 400) {
      throw (isArabic()
          ? AppTexts.unUniqueEmailException_ar
          : AppTexts.unUniqueEmailException);
    }
    throw Exception(
        '${isArabic() ? AppTexts.generalException_ar : AppTexts.generalException} : $e');
  }
}
