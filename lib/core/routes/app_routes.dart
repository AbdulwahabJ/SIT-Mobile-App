import 'package:flutter/material.dart';
import 'package:sit_app/features/auth/data/presentation/screens/reset_password_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/splash_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/verfiy_screen.dart';

import '../../features/auth/data/presentation/screens/login_screen.dart';
import '../../features/auth/data/presentation/screens/signup_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/login';
  static const String signupScreen = '/signup';
  static const String verfiyScreen = '/verfiy';
  static const String resetPasswordScreen = '/resetPassword';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LogInScreen());
      case signupScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case verfiyScreen:
        return MaterialPageRoute(builder: (_) => const VerfiyScreen());
      case resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
