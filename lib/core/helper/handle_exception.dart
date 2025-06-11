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
        e.response?.data['message'] == 'No Staff Found' &&
        e.response?.statusCode == 404) {
      throw (isArabic()
          ? AppTexts.noStaffAddedException_ar
          : AppTexts.noStaffAddedException);
    } else if (e is DioException &&
        e.response?.data['message'] == 'Email is already in use' &&
        e.response?.statusCode == 400) {
      throw (isArabic()
          ? AppTexts.unUniqueEmailException_ar
          : AppTexts.unUniqueEmailException);
    } else if (e is DioException &&
        e.response?.data['message'] == 'Failed to add group' &&
        e.response?.statusCode == 500) {
      throw (isArabic()
          ? AppTexts.cantAddGroupException_ar
          : AppTexts.cantAddGroupException);
    } else if (e is DioException &&
        e.response?.data['message'] == 'Group already exist' &&
        e.response?.statusCode == 500) {
      throw (isArabic()
          ? AppTexts.groupNameExistException_ar
          : AppTexts.groupNameExistException);
    } else if (e is DioException &&
        e.response?.data['message'] == 'unauthorized user' &&
        e.response?.statusCode == 401) {
      throw (isArabic()
          ? AppTexts.unAuthrizedUserException_ar
          : AppTexts.unAuthrizedUserException);
    }
    throw Exception(
        '${isArabic() ? AppTexts.generalException_ar : AppTexts.generalException} : $e');
  }
}
//unauthorized user