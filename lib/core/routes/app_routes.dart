import 'package:flutter/material.dart';
import 'package:sit_app/core/widgets/bottom_nav_bar.dart/bottom_nav_bar.dart';
import 'package:sit_app/core/widgets/bottom_nav_bar.dart/logic/bottom_nav_bar_cubit.dart';
import 'package:sit_app/features/auth/data/presentation/screens/home_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/reset_password_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/splash_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/verfiy_screen.dart';

import '../../features/auth/data/presentation/screens/login_screen.dart';
import '../../features/auth/data/presentation/screens/signup_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/';
  static const String signupScreen = '/signup';
  static const String verfiyScreen = '/verfiy';
  static const String resetPasswordScreen = '/resetPassword';
  static const String homeScreen = '/home';
  static const String navScreen = '/nav';

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
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case navScreen:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());
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
