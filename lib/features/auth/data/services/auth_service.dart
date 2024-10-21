import 'dart:async';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sit_app/core/network/dio_client.dart';
import 'package:sit_app/core/network/shared_preferenes.dart';

import '../../../../core/constants/app_text.dart';
import '../../../../core/helper/handle_exception.dart';
import '../models/user_model.dart';

class AuthService {
  final DioClient dioClient;

  AuthService(this.dioClient);

  Future<UserModel?> logIn(String email, String password) async {
    return handleException(() async {
      final response = await dioClient.post(
        AppTexts.loginApi,
        {
          'email': email,
          'password': password,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.data != null) {
        //
        final user = UserModel.fromJson(response.data['user']);
        await TokenStorage.saveToken(user.token);
        await TokenStorage.saveUser(user);
        return user;
        //
      } else {
        throw Exception();
      }
    });
  }

  // Future<UserModel?> _handleUserLogin(dynamic data) async {
  //   final user = UserModel.fromJson(data['user']);
  //   await TokenStorage.saveToken(user.token);
  //   await TokenStorage.saveUser(user);
  //   return user;
  // }

  // Future<StaffModel?> _handleStaffLogin(dynamic data) async {
  //   final staffUser = StaffModel.fromJson(data['staff']);
  //   await TokenStorage.saveToken(staffUser.token);
  //   await TokenStorage.saveStaff(staffUser);

  //   return staffUser;
  // }

  Future<void> signUp(
    String name,
    String email,
    String password,
    String phoneNumber,
    String? groupID,
    String role,
    dynamic languages,
    XFile? image,
  ) async {
    return handleException(() async {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'phone_number': phoneNumber,
        'group_id': groupID,
        'role': role,
        'languages': languages,
        'image':
            image != null ? await MultipartFile.fromFile(image.path) : 'null',
      });
      //
      final response = await dioClient.staffpost(
        AppTexts.registerApi,
        formData,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
        }),
      );

      if (response.statusCode == 201) {
        // final user = response.data['message'];
        // await TokenStorage.saveToken(user.token); // Save the token
        // await TokenStorage.saveUser(user);
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  Future<bool> verfiyEmail(String email) async {
    return handleException(() async {
      final response = await dioClient.post(
        AppTexts.verfiyEmailApi,
        {
          'email': email,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception();
      }
    });
  }

  Future<bool> resetPassword(String email, String confirmedPassword) async {
    return handleException(() async {
      final response = await dioClient.post(
        AppTexts.resetPasswordApi,
        {
          'email': email,
          'password': confirmedPassword,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('/');
      }
    });
  }

  Future<void> logOut() async {
    return handleException(() async {
      final token = await TokenStorage.getToken();

      final response = await dioClient.post(
        AppTexts.logoutApi,
        {},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        await TokenStorage.deleteToken();
        await TokenStorage.deleteUser();
      } else {
        throw Exception('Failed to log out');
      }
    });
  }
}
