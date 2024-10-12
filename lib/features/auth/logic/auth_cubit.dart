import 'package:bloc/bloc.dart';
import 'package:sit_app/core/network/shared_preferenes.dart';
import '../data/models/user_model.dart';
import '../data/services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService; // تعديل هنا لجعل authService متغيرًا.
  String verifiedEmail = '';
  UserModel? userInfo;

  AuthCubit(this.authService) : super(AuthInitial());
  Future<void> logIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authService.logIn(email, password);
      if (user != null) {
        userInfo = await TokenStorage.getUser();
        emit(AuthSuccess('Login successful: ${user.name}'));
      }
    } catch (e) {
      emit(AuthFailure('Login failed : ${e.toString()}'));
    }
  }

  Future<void> signUp(String name, String email, String password,
      String phoneNumber, String? groupID) async {
    emit(AuthLoading());
    try {
      final user = await authService.signUp(
        name,
        email,
        password,
        phoneNumber,
        groupID,
      );
      if (user != null) {
        userInfo = await TokenStorage.getUser();
        emit(AuthSuccess('Sign up successful: ${user.name}'));
      } else {
        emit(AuthFailure('Sign up failed: Could not create account.'));
      }
    } catch (e) {
      emit(AuthFailure('Sign up failed: ${e.toString()}'));
    }
  }

  Future<void> verifyEmail(String email) async {
    verifiedEmail = email;

    emit(AuthLoading());
    try {
      final success = await authService.verfiyEmail(email);
      if (success) {
        emit(AuthSuccess('Email verified successfully.'));
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

  Future<void> logOut() async {
    emit(AuthLoading());
    try {
      await authService.logOut();
      emit(AuthSuccess('Sign out  successful'));
    } catch (e) {
      emit(AuthFailure('Sign out  failed : ${e.toString()}'));
    }
  }
}
