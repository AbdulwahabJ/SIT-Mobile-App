import 'dart:async';
import '../../../../core/constants/app_text.dart';
import '../../../../core/helper/handle_exception.dart';
import '../models/user_model.dart';
import '../network/dio_client.dart';
import '../network/shared_preferenes.dart';

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

  Future<User?> signUp(String email, String password, String name,
      String phoneNumber, String code) async {
    return handleException(() async {
      final response = await dioClient.post(AppTexts.registerApi, {
        'email': email,
        'password': password,
        'name': name,
        'phone_number': phoneNumber,
        'code': code,
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
