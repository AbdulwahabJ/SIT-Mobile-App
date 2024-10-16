import 'dart:async';
import 'package:dio/dio.dart';
import 'package:sit_app/core/network/dio_client.dart';
import 'package:sit_app/core/network/shared_preferenes.dart';

import '../../../../core/constants/app_text.dart';
import '../../../../core/helper/user_info.dart';
import '../../../../core/helper/handle_exception.dart';
import '../../../customer_app/data/models/staff_model.dart';
import '../models/user_model.dart';

class AuthService {
  final DioClient dioClient;

  AuthService(this.dioClient);

  Future<dynamic> logIn(String email, String password) async {
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

      if (response.data != null && response.data is Map) {
        if (response.data.containsKey('user') &&
            response.data['user'] != null) {
          return await _handleUserLogin(response.data);
        } else if (response.data.containsKey('staff') &&
            response.data['staff'] != null) {
          return await _handleStaffLogin(response.data);
        } else {
          throw Exception('Invalid response structure');
        }
      } else {
        throw Exception('Failed to log in, invalid response');
      }
    });
  }

  Future<UserModel?> _handleUserLogin(dynamic data) async {
    final user = UserModel.fromJson(data['user']);
    await TokenStorage.saveToken(user.token);
    await TokenStorage.saveUser(user);
    return user;
  }

  Future<StaffModel?> _handleStaffLogin(dynamic data) async {
    final staffUser = StaffModel.fromJson(data['staff']);
    await TokenStorage.saveToken(staffUser.token);
    await TokenStorage.saveStaff(staffUser);

    return staffUser;
  }

  Future<UserModel?> signUp(String name, String email, String password,
      String phoneNumber, String? groupID) async {
    return handleException(() async {
      final response = await dioClient.post(
        AppTexts.registerApi,
        {
          'name': name,
          'email': email,
          'password': password,
          'phone_number': phoneNumber,
          'group_id': groupID,
          'role': 'user',
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        final user = UserModel.fromJson(response.data['user']);
        await TokenStorage.saveToken(user.token); // Save the token
        await TokenStorage.saveUser(user);
        var userr = await TokenStorage.getUser();
        print('sasasas::${userr!.name}');
        return UserModel.fromJson(response.data['user']);
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
      dynamic user = getLoggedInUser();
      dynamic logoutApi =
          user is UserModel ? AppTexts.logoutApi : AppTexts.staffLogoutApi;

      final response = await dioClient.post(
        logoutApi,
        {},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        await TokenStorage.deleteToken();
        user is UserModel
            ? await TokenStorage.deleteUser()
            : await TokenStorage.deleteStaff();
      } else {
        throw Exception('Failed to log out');
      }
    });
  }
}
