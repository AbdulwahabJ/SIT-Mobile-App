import 'package:get_it/get_it.dart';
import 'package:sit_app/features/auth/data/services/auth_service.dart';
import 'dio_client.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // تسجيل DioClient
  getIt.registerLazySingleton(() => DioClient());
  // تسجيل AuthService مع DioClient

  // تسجيل AuthService كـ Singleton مع DioClient
  getIt.registerLazySingleton(() => AuthService(getIt<DioClient>()));
}
