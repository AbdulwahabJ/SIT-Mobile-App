import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/text_field_decoration.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_padding.dart';
import '../widgets/custom_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _selectedCode;
  String? password;

  // String? _selectedDropDown;

  final List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3']; //

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // String? _phoneNumber;

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
            left: AppPadding.authScreenPadding,
            right: AppPadding.authScreenPadding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28),
                const Text(
                  AppTexts.signUp,
                  style: AppStyles.styleSemiBold26,
                ),
                const SizedBox(height: 20),
                // Full Name Field
                CustomTextField(
                  hintText: AppTexts.fullNameHintText,
                  icon: AppIcons.fullNameIcon,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    if (!RegExp(r'^[\u0621-\u064A\u0660-\u0669A-Za-z\s]+$')
                        .hasMatch(value)) {
                      return 'Please enter a valid name ';
                    }
                    if (value.length < 8) {
                      return 'your name too short';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                // Email Field
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
                // Phone Number Field
                // Phone Number Field
                const CustomPhoneField(),
                const SizedBox(height: 14),
                // Password Field
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
                const SizedBox(height: 14),
                // Dropdown Field for Code
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<String>(
                        iconSize: 24,
                        icon: AppIcons.dropDownMenuIcon,
                        decoration: InputDecoration(
                          enabledBorder: TextFieldDecoration.enabledBorder(),
                          focusedBorder: TextFieldDecoration.focusedBorder(),
                          errorBorder: TextFieldDecoration.errorBorder(),
                          focusedErrorBorder:
                              TextFieldDecoration.focusedErrorBorder(),
                          prefixIcon: AppIcons.codeIcon,
                        ),
                        hint: const Text(AppTexts.codeHintText),
                        value: _selectedCode,
                        items: _dropdownItems.map((code) {
                          return DropdownMenuItem<String>(
                            value: code,
                            child: Text(code),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCode = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a code';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 38),
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
