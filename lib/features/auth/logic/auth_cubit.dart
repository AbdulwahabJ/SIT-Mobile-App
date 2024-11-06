// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/helper/language.dart';
import '../data/models/user_model.dart';
import '../data/services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;
  String verifiedEmail = '';
  UserModel? userInfo;

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> logIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authService.logIn(email, password);
      if (user != null) {
        //
        userInfo = user;

        emit(AuthSuccess(isArabic()
            ? '${AppTexts.loginSuccess_ar} '
            : '${AppTexts.loginSuccess} '));
      }
    } catch (e) {
      emit(AuthFailure(isArabic()
          ? '${AppTexts.loginFailure_ar} ${e.toString()}'
          : '${AppTexts.loginFailure} ${e.toString()}'));
    }
  }

  Future<void> signUp(
    String name,
    String email,
    String password,
    String phoneNumber,
    String? groupID,
    String role,
    dynamic languages,
    dynamic image,
  ) async {
    emit(AuthLoading());
    try {
      await authService.signUp(
          name, email, password, phoneNumber, groupID, role, languages, image);

      if (role == 'user') {
        emit(AuthSuccess(isArabic()
            ? AppTexts.signUpSuccess_ar
            : '${AppTexts.signUpSuccess} '));
      }
      emit(AuthStaffSuccess(isArabic()
          ? AppTexts.staffAddSuccess_ar
          : '${AppTexts.staffAddSuccess} '));
    } catch (e) {
      emit(AuthFailure(isArabic()
          ? '${AppTexts.signUpFailure_ar} ${e.toString()}'
          : '${AppTexts.signUpFailure} ${e.toString()}'));
    }
  }

  Future<void> verifyEmail(String email) async {
    verifiedEmail = email;

    emit(AuthLoading());
    try {
      final success = await authService.verfiyEmail(email);
      if (success) {
        emit(AuthSuccess(isArabic()
            ? AppTexts.verificationSuccess_ar
            : AppTexts.verificationSuccess));
      }
    } catch (e) {
      emit(AuthFailure(isArabic()
          ? '${AppTexts.verificationFailure_ar} ${e.toString()}'
          : '${AppTexts.verificationFailure} ${e.toString()}'));
    }
  }

  Future<void> resetPassword(String email, String confirmedPassword) async {
    emit(AuthLoading());
    try {
      final success = await authService.resetPassword(email, confirmedPassword);
      if (success) {
        emit(AuthSuccess(isArabic()
            ? AppTexts.resetPasswordSuccess_ar
            : AppTexts.resetPasswordSuccess));
      } else {
        emit(AuthFailure(isArabic()
            ? AppTexts.resetPasswordFailure_ar
            : AppTexts.resetPasswordFailure));
      }
    } catch (e) {
      emit(AuthFailure(isArabic()
          ? '${AppTexts.resetPasswordFailure_ar} ${e.toString()}'
          : '${AppTexts.resetPasswordFailure} ${e.toString()}'));
    }
  }

  Future<void> logOut() async {
    emit(AuthLoading());
    try {
      await authService.logOut();
      emit(AuthSuccess(
          isArabic() ? AppTexts.signOutSuccess_ar : AppTexts.signOutSuccess));
    } catch (e) {
      emit(AuthFailure(isArabic()
          ? '${AppTexts.signOutFailure_ar} ${e.toString()}'
          : '${AppTexts.signOutFailure} ${e.toString()}'));
    }
  }

  void resetState() {
    emit(AuthInitial());
  }
}
