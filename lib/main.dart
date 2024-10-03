import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/features/auth/data/network/dio_client.dart';
import 'package:sit_app/features/auth/data/services/auth_service.dart';
import 'package:sit_app/features/auth/logic/auth_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(AuthService(DioClient())),
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
