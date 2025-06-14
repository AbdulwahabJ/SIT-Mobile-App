import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);

  // @override
  // List<Object> get props => [message];
}

class AuthStaffSuccess extends AuthState {
  final String message;

  AuthStaffSuccess(this.message);
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);

  @override
  List<Object> get props => [error];
}


//
