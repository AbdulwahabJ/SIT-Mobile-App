import 'dart:async';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sit_app/core/network/dio_client.dart';

import '../../../../core/constants/app_text.dart';
import '../../../../core/helper/handle_exception.dart';

class StaffService {
  final DioClient dioClient;

  StaffService(this.dioClient);

  Future<bool> addStaff(String name, String email, String password,
      String phoneNumber, String languages, XFile? image) async {
    return handleException(() async {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'role': 'staff',
        'phone_number': phoneNumber,
        'languages': languages,
        'image':
            image != null ? await MultipartFile.fromFile(image.path) : 'null',
      });

      final response = await dioClient.staffpost(
        AppTexts.registerApi,
        formData,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
        }),
      );

      if (response.statusCode == 200) {
        // final staffUser = StaffModel.fromJson(response.data['staff']);
        // await TokenStorage.saveStaffToken(staffUser.token);
        return true;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  Future<List<Map<String, dynamic>>> getStaff() async {
    return handleException(() async {
      final response = await dioClient.get(
        AppTexts.getStaffApi,
      );

      if (response.statusCode == 200) {
        List staffData = response.data['staff_data'];
        return List<Map<String, dynamic>>.from(staffData.map((item) => {
              'id': item['id'],
              'name': item['name'],
              'image': item['image'] ?? '',
              'languages': item['languages'],
              'phone_number': item['phone_number'],
            })); // ignore: avoid_print
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  Future<Response<dynamic>> deleteStaffUser(String? staffId) async {
    return handleException(() async {
      // final token = await TokenStorage.getToken();
      final response = await dioClient.delete(
        AppTexts.deleteStaffUserApi,
        {
          'id': staffId,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }
}
