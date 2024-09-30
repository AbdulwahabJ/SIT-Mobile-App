import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_padding.dart';
import '../../../../../core/utils/app_images.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // متغير لتحديد ما إذا كان يجب إظهار الـ CircularProgressIndicator
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.authScreenPadding,
            right: AppPadding.authScreenPadding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Image.asset(
                    Assets.companyLogo,
                    width: size.width * 0.6,
                    height: size.height * 0.28,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  AppTexts.signIn,
                  style: AppStyles.styleSemiBold26,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  hintText: AppTexts.mailHintText,
                  icon: AppIcons.logInMailIcon,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  hintText: AppTexts.passwordHintText,
                  icon: AppIcons.logInPasswordIcon,
                  type: 'password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                        .hasMatch(value)) {
                      return 'Password must contain at least 8 characters,\nincluding letters and numbers';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.verfiyScreen);
                      },
                      child: const Text(
                        AppTexts.forgetPassword,
                        style: AppStyles.styleReguler13,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Center(
                  child: InkWell(
                    child: CustomMainButton(
                      size: size,
                      isLoading: _isLoading,
                      buttonText: AppTexts.signUpTextButton,
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState?.validate() == true) {
                        setState(() {
                          _isLoading = true;
                        });
                        // محاكاة عملية تسجيل الدخول
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppTexts.dontHaveAccount),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signupScreen);
                        },
                        child: const Text(AppTexts.signUp,
                            style: AppStyles.styleReguler13)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
