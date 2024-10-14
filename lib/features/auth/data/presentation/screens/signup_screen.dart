import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_input/phone_input_package.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/auth/logic/auth_cubit.dart';
import 'package:sit_app/features/auth/logic/auth_state.dart';
import 'package:sit_app/generated/l10n.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_padding.dart';
import '../../../../../core/helper/validation.dart';
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
  final TextEditingController groupController = TextEditingController();

  // String? _selectedCode;
  String? password;

  // final List<String> _dropdownItems = const [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3'
  // ]; // قائمة ثابتة

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
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            });
            Navigator.pushReplacementNamed(context, AppRoutes.customerScreen);
          } else if (state is AuthFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            });
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
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
                    Text(
                      S.of(context).signup,
                      style: AppStyles.styleSemiBold26,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: nameController,
                      hintText: S.of(context).yourName,
                      icon: AppIcons.fullNameIcon,
                      validator: (value) => Validation.validateInput(
                          InputType.name, value, context),
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      controller: emailController,
                      hintText: AppTexts.mailHintText,
                      icon: AppIcons.mailIcon,
                      validator: (value) => Validation.validateInput(
                          InputType.email, value, context),
                    ),
                    const SizedBox(height: 14),
                    CustomPhoneField(
                      controller: phoneNumberController,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      hintText: S.of(context).yourPassword,
                      icon: AppIcons.passwordIcon,
                      type: 'password',
                      validator: (value) => Validation.validateInput(
                          InputType.password, value, context),
                      onChanged: (value) => password = value,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      controller: confirmedPasswordController,
                      hintText: S.of(context).confirmYourPassword,
                      icon: AppIcons.passwordIcon,
                      type: 'password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).confirmYourPassword;
                        }
                        if (value != password) {
                          // مقارنة كلمة المرور المدخلة بالتأكيد
                          return S.of(context).PasswordsNotMatch;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      controller: groupController,
                      hintText: S.of(context).writeGroupCode,
                      icon: AppIcons.groupIcon,
                    ),
                    const SizedBox(height: 38),
                    Center(
                      child: InkWell(
                        onTap: _onSignUpTap,
                        child: CustomMainButton(
                          isLoading: state is AuthLoading,
                          buttonText: S.of(context).sign,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onSignUpTap() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() == true) {
      final phoneNumber =
          '00${phoneNumberController.value!.countryCode}${phoneNumberController.value!.nsn}';
      context.read<AuthCubit>().signUp(
            nameController.text,
            emailController.text,
            confirmedPasswordController.text,
            phoneNumber,
            groupController.text,
          );
      print(
          'ffff: ${nameController.text}\n${emailController.text}\n${confirmedPasswordController.text}\n${groupController.text}');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    confirmedPasswordController.dispose();
    phoneNumberController.dispose();
    groupController.dispose();
    super.dispose();
  }
}
 // DropdownButtonFormField<String>(
                    //   iconSize: 24,
                    //   icon: AppIcons.dropDownMenuIcon,
                    //   decoration: _dropdownDecoration(),
                    //   hint: const Text(AppTexts.codeHintText),
                    //   value: _selectedCode,
                    //   items: _dropdownItems.map(_buildDropdownItem).toList(),
                    //   onChanged: (value) =>
                    //       setState(() => _selectedCode = value),
                    //   validator: (value) =>
                    //       value == null ? 'Please select a code' : null,
                    // ),  // InputDecoration _dropdownDecoration() {
  //   return InputDecoration(
  //     enabledBorder: TextFieldDecoration.enabledBorder(),
  //     focusedBorder: TextFieldDecoration.focusedBorder(),
  //     errorBorder: TextFieldDecoration.errorBorder(),
  //     focusedErrorBorder: TextFieldDecoration.focusedErrorBorder(),
  //     prefixIcon: AppIcons.codeIcon,
  //   );
  // }

  // DropdownMenuItem<String> _buildDropdownItem(String code) {
  //   return DropdownMenuItem<String>(
  //     value: code,
  //     child: Text(code),
  //   );
  // }