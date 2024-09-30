import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/routes/app_routes.dart';

import '../../../../../core/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.splashScreenColor,
      body: Center(
        child: Image.asset(
          Assets.splashLogo,
          width: size.width * 0.7,
          height: size.width * 0.4,
        ),
      ),
    );
  }
}
