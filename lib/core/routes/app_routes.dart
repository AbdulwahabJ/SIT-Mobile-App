import 'package:flutter/material.dart';
import 'package:sit_app/core/widgets/bottom_nav_bar.dart/bottom_nav_bar.dart';
import 'package:sit_app/features/auth/data/presentation/screens/home_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/reset_password_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/splash_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/verfiy_screen.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/data/presentation/screens/login_screen.dart';
import '../../features/auth/data/presentation/screens/signup_screen.dart';
import '../../features/customer_app/data/presentation/screens/moments_screen.dart';
import '../../features/customer_app/data/presentation/screens/settings_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/';
  static const String signupScreen = '/signup';
  static const String verfiyScreen = '/verfiy';
  static const String resetPasswordScreen = '/resetPassword';
  static const String homeScreen = '/home';
  static const String customerScreen = '/customerScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String momentsScreen = '/momentsScreen';

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
        // final user = settings.arguments as String; // تمرير البيانات إلى الصفحة

        return MaterialPageRoute(builder: (_) => HomeScreen());
      case customerScreen:
        return MaterialPageRoute(builder: (_) => const CustomerScreen());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case momentsScreen:
        return MaterialPageRoute(builder: (_) => const MomentsScreen());
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
