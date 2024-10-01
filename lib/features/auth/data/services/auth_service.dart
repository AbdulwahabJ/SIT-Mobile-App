import '../../../../core/constants/app_text.dart';
import '../models/user_model.dart';
import '../network/dio_client.dart';
import '../network/shared_preferenes.dart';

class AuthService {
  final DioClient dioClient;

  AuthService(this.dioClient);

  Future<User?> logIn(String email, String password) async {
    try {
      final response = await dioClient.post(AppTexts.loginApi, {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final user = User.fromJson(response.data['user']);
        await TokenStorage.saveToken(user.token); // تخزين التوكن
        return user;
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<User?> signUp(String email, String password, String name,
      String phoneNumber, String code) async {
    try {
      final response = await dioClient.post(AppTexts.registerApi, {
        'email': email,
        'password': password,
        'name': name,
        'phone_number': phoneNumber,
        'code': code,
      });

      if (response.statusCode == 200) {
        return User.fromJson(response.data['user']);
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }
}
