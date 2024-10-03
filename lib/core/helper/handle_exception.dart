import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sit_app/core/constants/app_text.dart';

Future<T> handleException<T>(Future<T> Function() action) async {
  try {
    return await action();
  } on SocketException {
    throw Exception(AppTexts.noInternetException);
  } on TimeoutException {
    throw Exception(AppTexts.timeOutException);
  } catch (e) {
    if (e is DioException &&
        e.response?.data['message'] == 'Invalid email' &&
        e.response?.statusCode == 401) {
      throw (AppTexts.dontHaveAccountException);
      //
    } else if (e is DioException &&
        e.response?.data['message'] == 'Invalid password' &&
        e.response?.statusCode == 401) {
      throw (AppTexts.wrongPasswordException);
      //
    } else if (e is DioException &&
        e.response?.data['message'] == 'email not exist' &&
        e.response?.statusCode == 404) {
      throw (AppTexts.verfiyEmailException);
    }
    //
    throw Exception(AppTexts.generalException);
  }
}
