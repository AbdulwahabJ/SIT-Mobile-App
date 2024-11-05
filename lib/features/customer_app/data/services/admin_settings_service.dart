import 'dart:async';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
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

//..............................................................................
//
//program functions
  Future<Response<dynamic>> addProgram(String? groupName, String? programName,
      String? date, String? time) async {
    return handleException(() async {
      final token = await TokenStorage.getToken();
      final response = await dioClient.post(
        AppTexts.addProgramApi,
        {
          'name': programName,
          'group_name': groupName,
          'date': date,
          'time': time,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        print('notification:${response.data['notification_sent']}');
        return response;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  Future<List<dynamic>> getProgramData(
      String? groupName, String? programName) async {
    return handleException(() async {
      //
      final token = await TokenStorage.getToken();
      final response = await dioClient.getProgram(
        AppTexts.getProgramApi,
        {
          'group_name': groupName,
          'name': programName,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        print('lll:${response.data['data']}');
        return response.data['data'];
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  Future<List<dynamic>> getAllProgramForGroup(String? groupName) async {
    return handleException(() async {
      //
      final token = await TokenStorage.getToken();
      final response = await dioClient.getProgram(
        AppTexts.getAllProgramsForGroupApi,
        {
          'group_name': groupName,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        print('lll:${response.data}');
        return response.data['data'];
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  Future<Response<dynamic>> updateProgramForGroup(
      String? programId,
      String? programUpdatedName,
      String? programUpdatedDate,
      String? programUpdatedTime) async {
    return handleException(() async {
      //
      final token = await TokenStorage.getToken();
      final response = await dioClient.post(
        AppTexts.updateProgramForGroupApi,
        {
          'program_id': programId,
          'updated_program_name': programUpdatedName,
          'updated_program_date': programUpdatedDate,
          'updated_program_time': programUpdatedTime,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        // print('lll:${response.data['data']}');
        return response;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  Future<Response<dynamic>> deleteProgram(String? prgramId) async {
    return handleException(() async {
      final token = await TokenStorage.getToken();
      final response = await dioClient.delete(
        AppTexts.deleteProgramApi,
        {
          'id': prgramId,
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

  Future<Response<dynamic>> getProgramsForToday(String? groupName) async {
    return handleException(() async {
      //
      final token = await TokenStorage.getToken();
      final response = await dioClient.getProgram(
        AppTexts.getProgramsForTodayApi,
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
        print('lll:${response.data['data']}');
        return response;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

//moment functions
  Future<Response> uploadMomentImages(
      String sectionName, List<XFile> images) async {
    return handleException(() async {
      var formData = FormData();

      formData.fields.add(MapEntry('section_name', sectionName));

      for (var image in images) {
        formData.files.add(MapEntry(
          'images[]',
          await MultipartFile.fromFile(image.path),
        ));
      }

      final response = await dioClient.postimages(
        AppTexts.addMomentsImagesApi,
        formData,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
        }),
      );

      if (response.statusCode == 200) {
        // print('sseecc${response.data['section_name']}');
        return response;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }

  Future<Response<dynamic>> getAllMoments() async {
    return handleException(() async {
      //
      // final token = await TokenStorage.getToken();
      final response = await dioClient.get(
        AppTexts.getAllMomentsApi,
      );

      if (response.statusCode == 200) {
        print('moments:${response.data}');
        return response;
      } else {
        throw Exception(response.data['message']);
      }
    });
  }
}
