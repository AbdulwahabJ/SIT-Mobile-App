import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_padding.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  String? password;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16),
          child: IconButton(
            icon: AppIcons.backIcon, // تغيير الأيقونة إلى أيقونة أخرى
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
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
                const SizedBox(height: 28),
                const Text(
                  AppTexts.resetPasswordHeader,
                  style: AppStyles.styleSemiBold26,
                ),
                const SizedBox(height: 20),
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
                  onChanged: (value) {
                    setState(() {
                      password = value; // تخزين الباسورد المدخل
                    });
                  },
                ),
                const SizedBox(height: 14),
                // Confirm Password Field
                CustomTextField(
                  hintText: 'Confirm Password',
                  icon: AppIcons.logInPasswordIcon,
                  type: 'password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != password) {
                      // مقارنة كلمة المرور المدخلة بالتأكيد
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 38),
                Center(
                  child: InkWell(
                    child: CustomMainButton(
                      isLoading: _isLoading,
                      buttonText: AppTexts.saveTextButton,
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState?.validate() == true) {
                        setState(() {
                          _isLoading = true;
                        });
                        // Simulate signup process
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
