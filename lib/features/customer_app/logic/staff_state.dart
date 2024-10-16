part of 'staff_cubit.dart';

abstract class StaffState {}

class StaffInitial extends StaffState {}

class StaffLoading extends StaffState {}

class StaffAdded extends StaffState {
  final String message;

  StaffAdded(this.message);
}

class StaffFailure extends StaffState {
  final String error;

  StaffFailure(this.error);
}
