part of 'staff_cubit.dart';

abstract class StaffState {}

class StaffInitial extends StaffState {}

class StaffLoading extends StaffState {}

class StaffSuccess extends StaffState {
  String message = '';

  StaffSuccess(this.message);
}

class StaffLodedd extends StaffState {
  List<Map<String, dynamic>> staffData;

  StaffLodedd(this.staffData);
}

class StaffFailure extends StaffState {
  final String error;

  StaffFailure(this.error);
}
