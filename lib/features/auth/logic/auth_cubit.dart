import 'package:bloc/bloc.dart';
import '../data/services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;
  String verifiedEmail = '';

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> logIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authService.logIn(email, password);
      if (user != null) {
        emit(AuthSuccess('Login successful: ${user.name}'));
        // } else {
        //   emit(AuthFailure('Login failed: Invalid credentials.'));
      } //'You should Sign up first
    } catch (e) {
      emit(AuthFailure('Login failed : ${e.toString()}'));
    }
  }

  Future<void> signUp(String name, String email, String password,
      String phoneNumber, String code) async {
    emit(AuthLoading());
    try {
      final user = await authService.signUp(
        email,
        password,
        name,
        phoneNumber,
        code,
      );
      if (user != null) {
        emit(AuthSuccess('Sign up successful: ${user.name}'));
      } else {
        emit(AuthFailure('Sign up failed: Could not create account.'));
      }
    } catch (e) {
      emit(AuthFailure('Sign up failed: ${e.toString()}'));
    }
  }

  Future<void> verfiyEmail(String email) async {
    verifiedEmail = email;

    emit(AuthLoading());
    try {
      final success = await authService.verfiyEmail(email);
      if (success) {
        emit(AuthSuccess('Email verified successfully.'));
      } else {
        // emit(AuthFailure('Verification failed: Email not found.'));
      }
    } catch (e) {
      emit(AuthFailure('Verification failed: ${e.toString()}'));
    }
  }

  Future<void> resetPassword(String email, String confirmedPassword) async {
    emit(AuthLoading());
    try {
      final success = await authService.resetPassword(email, confirmedPassword);
      if (success) {
        emit(AuthSuccess('Password reset successful.'));
      } else {
        emit(AuthFailure('Password reset failed: Please try again later.'));
      }
    } catch (e) {
      emit(AuthFailure('Password reset failed: ${e.toString()}'));
    }
  }
}
