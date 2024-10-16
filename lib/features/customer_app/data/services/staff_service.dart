import 'dart:async';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sit_app/core/network/dio_client.dart';
import 'package:sit_app/features/customer_app/data/models/staff_model.dart';

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
}
