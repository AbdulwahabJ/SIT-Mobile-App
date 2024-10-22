import 'dart:async';
import 'package:dio/dio.dart';
import 'package:sit_app/core/network/dio_client.dart';
import 'package:sit_app/core/network/shared_preferenes.dart';
import '../../../../core/constants/app_text.dart';
import '../../../../core/helper/handle_exception.dart';

class AdminSettingsService {
  final DioClient dioClient;

  AdminSettingsService(this.dioClient);

//..............................................................................
//Admin functions
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

  Future<Response<dynamic>> updateGroupName(
      String? oldGroupNmae, String? newGroupNmae) async {
    return handleException(() async {
      final token = await TokenStorage.getToken();
      final response = await dioClient.post(
        AppTexts.updateGroupNameApi,
        {
          'old_group_name': oldGroupNmae,
          'new_group_name': newGroupNmae,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        // ignore: avoid_print
        // await TokenStorage.updateGroupId(
        //     '${response.data['user']['group_id']}');

        return response;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  Future<Response<dynamic>> deleteGroupName(String groupName) async {
    return handleException(() async {
      final token = await TokenStorage.getToken();
      final response = await dioClient.delete(
        AppTexts.deleteGroupNameApi,
        {
          'name': groupName,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('resp:${response.data['message']}');

        return response;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

//..............................................................................
//
//user functions
  Future<Response<dynamic>> updateUserGroup(String? groupName) async {
    return handleException(() async {
      final token = await TokenStorage.getToken();
      final response = await dioClient.post(
        AppTexts.updateUserGroupApi,
        {
          'group_name': groupName,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        // ignore: avoid_print
        await TokenStorage.updateGroupId(
            '${response.data['user']['group_id']}');

        return response;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

//..............................................................................
//
//General functions
  Future<List<dynamic>> getGroup() async {
    return handleException(() async {
      final response = await dioClient.get(AppTexts.getGroupApi);

      if (response.statusCode == 200) {
        print('lll:${response.data['groups']}');
        return response.data['groups'];
      } else {
        throw Exception(response.data['message']);
      }
    });
  }
}
//