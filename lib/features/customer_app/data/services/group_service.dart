import 'dart:async';
import 'package:dio/dio.dart';
import 'package:sit_app/core/network/dio_client.dart';
import '../../../../core/constants/app_text.dart';
import '../../../../core/helper/handle_exception.dart';

class GroupService {
  final DioClient dioClient;

  GroupService(this.dioClient);

  Future<Response> addGroup(String groupName) async {
    return handleException(() async {
      final response = await dioClient.post(
        AppTexts.addGroupApi,
        {
          'name': groupName,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 201) {
        // print('dsds:${response.data['message']}');
        return response;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }
}
