import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/constants/app_padding.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';

import '../../../logic/auth_cubit.dart';
import '../../../logic/auth_state.dart';

class VerfiyScreen extends StatefulWidget {
  const VerfiyScreen({super.key});

  @override
  State<VerfiyScreen> createState() => _VerfiyScreenState();
}

class _VerfiyScreenState extends State<VerfiyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  // String email = '';
  bool _isLoading = false;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16),
          child: IconButton(
            icon: AppIcons.backIcon, // تغيير الأيقونة إلى أيقونة أخرى
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            setState(() => _isLoading = true);
          } else if (state is AuthSuccess) {
            setState(() {
              _isLoading = false;
            });
            Navigator.pushReplacementNamed(
                context, AppRoutes.resetPasswordScreen);
          } else if (state is AuthFailure) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: SingleChildScrollView(
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
                    AppTexts.verfiyTextButton,
                    style: AppStyles.styleSemiBold26,
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 14),
                  CustomTextField(
                    controller: emailController,
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
                  const SizedBox(height: 38),
                  Center(
                    child: InkWell(
                      child: CustomMainButton(
                        isLoading: _isLoading,
                        buttonText: AppTexts.verfiyTextButton,
                      ),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState?.validate() == true) {
                          context
                              .read<AuthCubit>()
                              .verfiyEmail(emailController.text);
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
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
