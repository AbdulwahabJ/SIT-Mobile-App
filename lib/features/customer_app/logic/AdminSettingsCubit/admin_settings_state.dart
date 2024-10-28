// part of 'group_cubit.dart';

abstract class AdminSettingsState {}

class AdminSettingsInitial extends AdminSettingsState {}

class AdminSettingsLoading extends AdminSettingsState {}

class AdminSettingsSuccess extends AdminSettingsState {
  final String message;

  AdminSettingsSuccess(this.message);
}

class AdminSettingsFailure extends AdminSettingsState {
  final String message;

  AdminSettingsFailure(this.message);
}

//..............................................................................
//
//Exception for user
class UpdateUserGroupSuccess extends AdminSettingsState {
  final String message;

  UpdateUserGroupSuccess(this.message);
}

//..............................................................................
//
//Admin ...Group
class UpdateGroupNameSuccess extends AdminSettingsState {
  final String message;

  UpdateGroupNameSuccess(this.message);
}

class DeleteGroupNameSuccess extends AdminSettingsState {
  final String message;

  DeleteGroupNameSuccess(this.message);
}
//..............................................................................
//
//Admin ..Program

class DataProgramForUpdateSuccess extends AdminSettingsState {
  List<dynamic> dataForUpdate = [];
  DataProgramForUpdateSuccess(this.dataForUpdate);
}

class GetAllProgramsForGroupSuccess extends AdminSettingsState {
  List<dynamic> allPrograms = [];
  GetAllProgramsForGroupSuccess(this.allPrograms);
}

class UpdateProgramForGroup extends AdminSettingsState {
  String message;
  UpdateProgramForGroup(this.message);
}

class DeleteProgramSuccesse extends AdminSettingsState {
  String message;
  DeleteProgramSuccesse(this.message);
}
