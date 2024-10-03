import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_input/phone_input_package.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/text_field_decoration.dart';
import 'package:sit_app/features/auth/logic/auth_cubit.dart';
import 'package:sit_app/features/auth/logic/auth_state.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_padding.dart';
import '../widgets/custom_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final PhoneController phoneNumberController =
      PhoneController(const PhoneNumber(isoCode: IsoCode.US, nsn: ''));
  final TextEditingController confirmedPasswordController =
      TextEditingController();

  bool _isLoading = false;
  String? _selectedCode;
  String? password;

  final List<String> _dropdownItems = const [
    'Item 1',
    'Item 2',
    'Item 3'
  ]; // قائمة ثابتة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16),
          child: IconButton(
            icon: AppIcons.backIcon,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            setState(() => _isLoading = true);
          } else if (state is AuthSuccess) {
            setState(() => _isLoading = false);
            Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
          } else if (state is AuthFailure) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.authScreensPadding,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 28),
                  const Text(
                    AppTexts.signUpHeader,
                    style: AppStyles.styleSemiBold26,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: nameController,
                    hintText: AppTexts.fullNameHintText,
                    icon: AppIcons.fullNameIcon,
                    validator: _validateFullName,
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: emailController,
                    hintText: AppTexts.mailHintText,
                    icon: AppIcons.logInMailIcon,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 14),
                  CustomPhoneField(
                    controller: phoneNumberController,
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    hintText: AppTexts.passwordHintText,
                    icon: AppIcons.logInPasswordIcon,
                    type: 'password',
                    validator: _validatePassword,
                    onChanged: (value) => password = value,
                  ),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: confirmedPasswordController,
                    hintText: 'Confirm Password',
                    icon: AppIcons.logInPasswordIcon,
                    type: 'password',
                    validator: _validateConfirmedPassword,
                  ),
                  const SizedBox(height: 14),
                  DropdownButtonFormField<String>(
                    iconSize: 24,
                    icon: AppIcons.dropDownMenuIcon,
                    decoration: _dropdownDecoration(),
                    hint: const Text(AppTexts.codeHintText),
                    value: _selectedCode,
                    items: _dropdownItems.map(_buildDropdownItem).toList(),
                    onChanged: (value) => setState(() => _selectedCode = value),
                    validator: (value) =>
                        value == null ? 'Please select a code' : null,
                  ),
                  const SizedBox(height: 38),
                  Center(
                    child: InkWell(
                      onTap: _onSignUpTap,
                      child: CustomMainButton(
                        isLoading: _isLoading,
                        buttonText: AppTexts.signUpTextButton,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      enabledBorder: TextFieldDecoration.enabledBorder(),
      focusedBorder: TextFieldDecoration.focusedBorder(),
      errorBorder: TextFieldDecoration.errorBorder(),
      focusedErrorBorder: TextFieldDecoration.focusedErrorBorder(),
      prefixIcon: AppIcons.codeIcon,
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(String code) {
    return DropdownMenuItem<String>(
      value: code,
      child: Text(code),
    );
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (!RegExp(r'^[\u0621-\u064A\u0660-\u0669A-Za-z\s]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    }
    if (value.length < 8) {
      return 'your name too short';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
      return 'Password must contain at least 8 characters, including letters and numbers';
    }
    return null;
  }

  String? _validateConfirmedPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _onSignUpTap() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() == true) {
      //
      final String phoneNumber =
          '00${phoneNumberController.value!.countryCode}${phoneNumberController.value!.nsn}';
      //
      context.read<AuthCubit>().signUp(
            nameController.text,
            emailController.text,
            confirmedPasswordController.text,
            phoneNumber,
            _selectedCode!,
          );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    confirmedPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
