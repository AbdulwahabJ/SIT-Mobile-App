import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://yourapi.com/api', // ضع رابط الـ API الخاص بك هنا
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 3),
          ),
        ) {
    _dio.interceptors.add(LogInterceptor(responseBody: true)); // لمشاهدة اللوج الخاص بالاستجابة
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
