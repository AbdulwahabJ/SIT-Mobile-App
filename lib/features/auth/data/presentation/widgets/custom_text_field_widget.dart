import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Icon icon;
  final String? type;
  final String? Function(String?)? validator; // Add a validator parameter

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.type,
    this.validator, // Pass the validator function
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.type == 'password' ? !passwordVisible : false,
      decoration: InputDecoration(
        suffixIcon: widget.type == 'password'
            ? IconButton(
                icon: passwordVisible
                    ? AppIcons.passwordVisibilityIcon
                    : AppIcons.passwordNotVisibilityIcon,
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible; // Toggle visibility
                  });
                },
              )
            : null,
        hintText: widget.hintText,
        hintStyle: AppStyles.styleLight14,
        prefixIcon: widget.icon,
        enabledBorder: enabledBorder(),
        focusedBorder: focusedBorder(),
        errorBorder: errorBorder(),
        focusedErrorBorder: focusedErrorBorder(),
      ),

      validator: widget.validator, // Add validator here
    );
  }

  OutlineInputBorder focusedErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.5,
      ),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.5,
      ),
    );
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    );
  }

  OutlineInputBorder enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
        width: 1.5,
      ),
    );
  }
}
