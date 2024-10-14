import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/generated/l10n.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_padding.dart';
import '../../../../../core/helper/validation.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../logic/auth_cubit.dart';
import '../../../logic/auth_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController confirmedPasswordController =
      TextEditingController();

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
              Navigator.pushNamed(
                context,
                AppRoutes.loginScreen,
              );
            },
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
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.loginScreen,
            );
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
                    Text(
                      S.of(context).resetPassword,
                      style: AppStyles.styleSemiBold26,
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 14),
                    CustomTextField(
                      hintText: S.of(context).yourPassword,
                      icon: AppIcons.passwordIcon,
                      type: 'password',
                      validator: (value) => Validation.validateInput(
                          InputType.password, value, context),
                      onChanged: (value) {
                        setState(() {
                          password = value; // تخزين الباسورد المدخل
                        });
                      },
                    ),
                    const SizedBox(height: 14),
                    // Confirm Password Field
                    CustomTextField(
                      controller: confirmedPasswordController,
                      hintText: S.of(context).confirmYourPassword,
                      icon: AppIcons.passwordIcon,
                      type: 'password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).confirmPassword;
                        }
                        if (value != password) {
                          // مقارنة كلمة المرور المدخلة بالتأكيد
                          return S.of(context).PasswordsNotMatch;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 38),
                    Center(
                      child: InkWell(
                        child: CustomMainButton(
                          isLoading: state is AuthLoading,
                          buttonText: S.of(context).save,
                        ),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState?.validate() == true) {
                            final verifiedEmail =
                                context.read<AuthCubit>().verifiedEmail;

                            context.read<AuthCubit>().resetPassword(
                                verifiedEmail,
                                confirmedPasswordController.text);
                            //
                            // print(
                            //     'assasaffccc:${verifiedEmail}\n ${confirmedPasswordController.text}');
                          }
                        },
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

  @override
  void dispose() {
    confirmedPasswordController.dispose();
    super.dispose();
  }
}
