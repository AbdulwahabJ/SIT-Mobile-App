import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/text_field_decoration.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Icon icon;
  final String? type;
  final String? Function(String?)? validator; // Add a validator parameter
  final Function(String)? onChanged; // Add onChanged callback

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.type,
    this.validator, // Pass the validator function
    this.onChanged, // Pass the onChanged function
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
        enabledBorder: TextFieldDecoration.enabledBorder(),
        focusedBorder: TextFieldDecoration.focusedBorder(),
        errorBorder: TextFieldDecoration.errorBorder(),
        focusedErrorBorder: TextFieldDecoration.focusedErrorBorder(),
      ),
      validator: widget.validator, // Add validator here
      onChanged: widget.onChanged, // Trigger the onChanged callback
    );
  }
}
