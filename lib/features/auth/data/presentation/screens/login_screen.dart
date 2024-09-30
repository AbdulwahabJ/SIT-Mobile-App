import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/auth/logic/auth_cubit.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_padding.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_screen_utils.dart';
import '../../../logic/auth_state.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  LogInScreenState createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen> with RouteAware {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  // void didPopNext() {
  //   super.didPopNext();
  //   _formKey.currentState?.reset();
  //   emailController.clear();
  //   passwordController.clear();
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.authScreensPadding,
            right: AppPadding.authScreensPadding,
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
                    height: ScreenUtil.getHeight(context, 0.28),
                    width: ScreenUtil.getWidth(context, 0.6),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  AppTexts.signInHeader,
                  style: AppStyles.styleSemiBold26,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: emailController, // تعيين الـ controller للحقل
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
                  controller: passwordController, // تعيين الـ controller للحقل
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
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.verfiyScreen);
                      },
                      child: const Text(
                        AppTexts.forgetPassword,
                        style: AppStyles.styleReguler13,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                BlocConsumer(listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.verfiyScreen);
                  } else if (state is AuthFailure) {
                    setState(() {
                      _isLoading = false;
                    });
                    // عرض رسالة الخطأ
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                }, builder: (context, state) {
                  if (state is AuthLoading) {
                    setState(() {
                      _isLoading = true;
                    });
                  }
                  return Center(
                    child: InkWell(
                      child: CustomMainButton(
                        isLoading: _isLoading,
                        buttonText: AppTexts.signInTextButton,
                      ),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState?.validate() == true) {
                          final cubit = context.read<AuthCubit>();
                          cubit.logIn(
                              emailController.text, passwordController.text);
                          // محاكاة عملية تسجيل الدخول
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      },
                    ),
                  );
                }),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppTexts.dontHaveAccount),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signupScreen);
                        },
                        child: const Text(AppTexts.signUpHeader,
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
