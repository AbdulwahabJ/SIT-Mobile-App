import 'dart:async';
import 'package:sit_app/core/network/dio_client.dart';
import 'package:sit_app/core/network/shared_preferenes.dart';

import '../../../../core/constants/app_text.dart';
import '../../../../core/helper/handle_exception.dart';
import '../models/user_model.dart';


class AuthService {
  final DioClient dioClient;

  AuthService(this.dioClient);

  Future<User?> logIn(String email, String password) async {
    return handleException(() async {
      final response = await dioClient.post(AppTexts.loginApi, {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final user = User.fromJson(response.data['user']);
        await TokenStorage.saveToken(user.token); // Save the token
        return user;
      } else {
        throw Exception();
      }
    });
  }

  Future<User?> signUp(String name, String email, String password,
      String phoneNumber, String? groupID) async {
    return handleException(() async {
      final response = await dioClient.post(AppTexts.registerApi, {
        'name': name,
        'email': email,
        'password': password,
        'phone_number': phoneNumber,
        'group_id': groupID,
      });

      if (response.statusCode == 200) {
        return User.fromJson(response.data['user']);
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  Future<bool> verfiyEmail(String email) async {
    return handleException(() async {
      final response = await dioClient.post(AppTexts.verfiyEmailApi, {
        'email': email,
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception();
      }
    });
  }

  Future<bool> resetPassword(String email, String confirmedPassword) async {
    return handleException(() async {
      final response = await dioClient.post(AppTexts.resetPasswordApi, {
        'email': email,
        'password': confirmedPassword,
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('/');
      }
    });
  }
}
