import 'package:bloc/bloc.dart';
import '../data/services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> logIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authService.logIn(email, password);
      emit(AuthSuccess('Login successful: ${user?.name}'));
    } catch (e) {
      emit(AuthFailure('Login failed: $e'));
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
      emit(AuthSuccess('Sign up successful: ${user?.name}'));
    } catch (e) {
      emit(AuthFailure('Sign up failed: $e'));
    }
  }
}
