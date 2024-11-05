import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sit_app/features/customer_app/data/services/admin_settings_service.dart';
import 'package:sit_app/features/customer_app/logic/AdminSettingsCubit/admin_settings_state.dart';

class AdminSettingsCubit extends Cubit<AdminSettingsState> {
  AdminSettingsCubit(this.adminSettingsService) : super(AdminSettingsInitial());
  final AdminSettingsService adminSettingsService;
  List<dynamic>? allGroups;

  //
  //............................................................................
  //Group functions
  Future<void> addGroup(String name) async {
    //
    emit(AdminSettingsLoading());
    try {
      //
      final response = await adminSettingsService.addGroup(name);
      emit(AdminSettingsSuccess(response.data['message']));
      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

  Future<void> updateGroupName(
      String? oldGroupNmae, String? newGroupNmae) async {
    //
    emit(AdminSettingsLoading());
    try {
      //
      final response = await adminSettingsService.updateGroupName(
          oldGroupNmae, newGroupNmae);

      emit(UpdateGroupNameSuccess(response.data['message']));
      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

  Future<void> deleteGroupName(String groupName) async {
    //
    emit(AdminSettingsLoading());
    try {
      //
      final response = await adminSettingsService.deleteGroupName(groupName);

      emit(DeleteGroupNameSuccess(response.data['message']));
      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

//..............................................................................
//
//user function
  Future<void> updateUserGroup(String? groupName) async {
    //
    emit(AdminSettingsLoading());
    try {
      //
      final response = await adminSettingsService.updateUserGroup(groupName);

      emit(UpdateUserGroupSuccess(response.data['message']));
      // emit(GetProgramsForTodayUpdateSuccesse());
      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

//..............................................................................
//
//Program functions
  Future<void> addProgram(String? groupName, String? programName, String? date,
      String? time) async {
    //
    // print(
    //     "ddd:${date.runtimeType} , ${time.runtimeType} ,${groupName.runtimeType},${programName.runtimeType}");
    emit(AdminSettingsLoading());
    try {
      //
      final response = await adminSettingsService.addProgram(
          groupName, programName, date, time);
      emit(AdminSettingsSuccess(response.data['message']));
      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

  Future<void> getProgramDataForUpdate(
      String? groupName, String? programName) async {
    emit(AdminSettingsLoading());
    //
    try {
      //
      final response =
          await adminSettingsService.getProgramData(groupName, programName);
      print('rr:${response}');
      emit(DataProgramForUpdateSuccess(response));

      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

  Future<void> getAllProgramsForGroup(String? groupName) async {
    emit(AdminSettingsLoading());
    //
    try {
      //
      final response =
          await adminSettingsService.getAllProgramForGroup(groupName);
      // print('rr:${response}');
      emit(GetAllProgramsForGroupSuccess(response));

      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

  Future<void> updateProgramForGroup(
      String? programId,
      String? programUpdatedName,
      String? programUpdatedDate,
      String? programUpdatedTime) async {
    emit(AdminSettingsLoading());
    //
    try {
      //
      final response = await adminSettingsService.updateProgramForGroup(
          programId,
          programUpdatedName,
          programUpdatedDate,
          programUpdatedTime);
      // print('rr:${response}');
      emit(AdminSettingsSuccess(response.data['message']));

      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

  Future<void> deleteProgram(String? prgramId) async {
    //
    emit(AdminSettingsLoading());
    try {
      //
      final response = await adminSettingsService.deleteProgram(prgramId);

      emit(DeleteProgramSuccesse(response.data['message']));
      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

  Future<void> getProgramsForToday(String? groupName) async {
    emit(AdminSettingsLoading());

    try {
      Response<dynamic> response =
          await adminSettingsService.getProgramsForToday(groupName);

      // ignore: avoid_print
      print('rr: ${response.data['data']}');

      emit(GetProgramsForTodaySuccesse(response.data['data']));
      // emit(GetProgramsForTodayUpdateSuccesse());

      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

//..............................................................................
//
//Moments functions
  Future<void> uploadMomentsImages(
      String sectionName, List<XFile> images) async {
    emit(AdminSettingsLoading());
    try {
      //
      final response =
          await adminSettingsService.uploadMomentImages(sectionName, images);
      emit(UploadAllMomentsSuccesse(response.data['message']));
      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

  Future<void> getMoments() async {
    emit(AdminSettingsLoading());
    //
    try {
      //
      final response = await adminSettingsService.getAllMoments();
      // print('rr:${response}');
      emit(GetMomentsSuccesse(response.data['section1'],
          response.data['section2'], response.data['section3']));

      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

  Future<void> deleteMomentsImage(String? imagepath) async {
    //
    emit(AdminSettingsLoading());
    try {
      //
      final response = await adminSettingsService.deleteImage(imagepath);

      emit(DeleteMomentImageSuccesse(response.data['message']));
      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

//..............................................................................
//
//General functions
  Future<void> getGroup() async {
    //
    try {
      //
      final response = await adminSettingsService.getGroup();
      allGroups = response;
      //
    } catch (e) {
      emit(AdminSettingsFailure(e.toString()));
    }
  }

//resetState function
  void resetState() {
    emit(AdminSettingsInitial());
  }
}
