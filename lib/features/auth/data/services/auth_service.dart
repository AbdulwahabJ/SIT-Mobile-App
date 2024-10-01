import '../models/user_model.dart';
import '../network/dio_client.dart';
import '../network/shared_preferenes.dart';

class AuthService {
  final DioClient dioClient;

  AuthService(this.dioClient);

  Future<User?> logIn(String email, String password) async {
    try {
      final response = await dioClient.post('/login', {
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

  Future<User?> signUp(String email, String password, String username) async {
    try {
      final response = await dioClient.post('/signup', {
        'email': email,
        'password': password,
        'username': username,
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
