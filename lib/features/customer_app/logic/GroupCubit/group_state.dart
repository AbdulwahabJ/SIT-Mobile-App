// part of 'group_cubit.dart';

abstract class GroupState {}

class GroupInitial extends GroupState {}

class GroupLoading extends GroupState {}

class GroupSuccess extends GroupState {
  final String message;

  GroupSuccess(this.message);
}

class GroupFailure extends GroupState {
  final String message;

  GroupFailure(this.message);
}

// class StaffLodedd extends GroupState {
//   List<Map<String, dynamic>> staffData;

//   StaffLodedd(this.staffData);
// }

// class StaffNotLodedd extends GroupState {
//   final String error;

//   StaffNotLodedd(this.error);
// }
