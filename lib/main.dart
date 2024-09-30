import 'package:flutter/material.dart';
import 'package:sit_app/core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.signupScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
