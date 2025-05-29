import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sit_app/core/constants/app_text.dart';
import 'package:sit_app/core/helper/language.dart';
import 'package:sit_app/core/routes/app_routes.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_main_button.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/custom_text_field_widget.dart';
import 'package:sit_app/features/auth/logic/auth_cubit.dart';
import 'package:sit_app/generated/l10n.dart';
import '../../../logic/auth_state.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_padding.dart';
import '../../../../../core/helper/validation.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_screen_utils.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  LogInScreenState createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool enabeld = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            enabeld = !enabeld;
          } else if (state is AuthSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            });
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.customerScreen,
            );
          } else if (state is AuthFailure) {
            enabeld = !enabeld;
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
                    const SizedBox(height: 60),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LanguageIcon(),
                      ],
                    ),
                    Center(
                      child: Image.asset(
                        AppImages.companyLogo,
                        height: ScreenUtil.getHeight(context, 0.28),
                        width: ScreenUtil.getWidth(context, 0.6),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).signin,
                      style: AppStyles.styleSemiBold26,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: emailController,
                      hintText: AppTexts.mailHintText,
                      icon: AppIcons.mailIcon,
                      validator: (value) => Validation.validateInput(
                          InputType.email, value, context),
                      enabled: enabeld,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      controller: passwordController,
                      hintText: S.of(context).Password,
                      icon: AppIcons.passwordIcon,
                      type: 'password',
                      validator: (value) => Validation.validateInput(
                          InputType.password, value, context),
                      enabled: enabeld,
                    ),
                    Row(
                      mainAxisAlignment: isArabic()
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.verfiyScreen);
                          },
                          child: Text(
                            S.of(context).forgetPassword,
                            style: AppStyles.styleReguler13,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState?.validate() == true) {
                            context.read<AuthCubit>().logIn(
                                emailController.text, passwordController.text);
                          }
                        },
                        child: CustomMainButton(
                          isLoading: state is AuthLoading,
                          buttonText: S.of(context).signInButton,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).dontHaveaccount),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.signupScreen);
                          },
                          child: Text(
                            S.of(context).signup,
                            style: AppStyles.styleReguler13,
                          ),
                        ),
                      ],
                    ),
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
