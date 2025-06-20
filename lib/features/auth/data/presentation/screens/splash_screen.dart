import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/network/shared_preferenes.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/features/auth/data/presentation/screens/login_screen.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_screen_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    TokenStorage.deleteToken();
    TokenStorage.deleteUser();
    _timer = Timer(const Duration(seconds: 3), () {
      _checkLoginStatus();
      _navigateToLoginScreen();
    });
  }

  Future<void> _checkLoginStatus() async {
    String? token = await TokenStorage.getToken();

    if (!mounted) return;

    if (token != null) {
      Navigator.pushReplacementNamed(context, AppRoutes.customerScreen);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    }
  }

  void _navigateToLoginScreen() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LogInScreen(), // استبدل LogInScreen بشاشتك الفعلية
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // السحب من اليمين
          const end = Offset.zero; // نقطة النهاية (بدون إزاحة)
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreenColor,
      body: Center(
        child: Image.asset(
          AppImages.splashLogo,
          width: ScreenUtil.getHeight(context, 0.7),
          height: ScreenUtil.getHeight(context, 0.17),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
