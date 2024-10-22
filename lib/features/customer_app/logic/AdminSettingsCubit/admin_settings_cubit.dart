import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
