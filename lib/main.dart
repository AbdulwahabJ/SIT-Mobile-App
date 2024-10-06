import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/features/auth/data/network/get_it.dart';
import 'package:sit_app/features/auth/data/services/auth_service.dart';
import 'package:sit_app/features/auth/logic/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(); // تسجيل DioClient و SharedPreferences
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(GetIt.I<AuthService>()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
