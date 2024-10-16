import 'package:flutter/material.dart';
import 'package:sit_app/core/widgets/bottom_nav_bar.dart/customer_screen.dart';
import 'package:sit_app/features/customer_app/data/presentation/screens/CustomerScreens/home_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/reset_password_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/splash_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/verfiy_screen.dart';
import 'package:sit_app/features/customer_app/data/presentation/screens/CustomerScreens/pdf_viewer_screen.dart';
import 'package:sit_app/features/customer_app/data/presentation/screens/StaffScreens/staff_screen.dart';
import '../../features/auth/data/presentation/screens/login_screen.dart';
import '../../features/auth/data/presentation/screens/signup_screen.dart';
import '../../features/customer_app/data/presentation/screens/CustomerScreens/moments_screen.dart';
import '../../features/customer_app/data/presentation/screens/CustomerScreens/settings_screen.dart';
import '../../features/customer_app/data/presentation/screens/CustomerScreens/staff_customer_screen.dart';

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
  static const String pdfViewerScreen = '/PdfViewerScreen';
  static const String staffCustomerScreen = '/staffCustomerScreen';
  static const String staffScreen = '/staffScreen';

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
      case customerScreen:
        return MaterialPageRoute(builder: (_) => const CustomerScreen());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case momentsScreen:
        return MaterialPageRoute(builder: (_) => const MomentsScreen());
      case staffCustomerScreen:
        return MaterialPageRoute(builder: (_) => const StaffCustomerScreen());
      case pdfViewerScreen:
        final arguments = settings.arguments as List;
        final path = arguments[0] as String;
        final text = arguments[1] as String;

        return MaterialPageRoute(
            builder: (_) => PdfViewerScreen(path: path, text: text));

      case staffScreen:
        return MaterialPageRoute(builder: (_) => const StaffScreen());
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
