import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  final Dio _dio;

  factory DioClient() {
    return _instance;
  }
  DioClient._internal()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.30.47:8001/api',
            connectTimeout: const Duration(seconds: 300),
            receiveTimeout: const Duration(seconds: 300),
          ),
        ) {
    _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true)); // لمشاهدة اللوج الخاص بالاستجابة
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data,
      {required Options options}) async {
    try {
      final response = await _dio.post(endpoint, data: data, options: options);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postimages(String endpoint, dynamic data,
      {required Options options}) async {
    try {
      // تحقق مما إذا كانت البيانات من نوع FormData
      if (data is FormData) {
        final response =
            await _dio.post(endpoint, data: data, options: options);
        return response;
      } else {
        // إذا كانت البيانات ليست FormData، استخدمها كما هي
        final response =
            await _dio.post(endpoint, data: data, options: options);
        return response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> staffpost(String endpoint, FormData data,
      {required Options options}) async {
    try {
      final response = await _dio.post(endpoint, data: data, options: options);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(
        endpoint,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getProgram(String endpoint, Map<String, dynamic> data,
      {required Options options}) async {
    try {
      final response = await _dio.get(endpoint, data: data, options: options);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // إضافة دالة deleteGroup
  Future<Response> delete(String endpoint, Map<String, dynamic> data,
      {required Options options}) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
