import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_icons.dart';
import 'package:sit_app/core/utils/app_screen_utils.dart';
import 'package:sit_app/features/auth/data/presentation/widgets/text_field_decoration.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Icon icon;
  final String? type;
  final String? Function(String?)? validator; // الفالديشن
  final Function(String)? onChanged; // رد فعل عند تغيير النص
  final TextEditingController? controller; // إضافة TextEditingController

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.type,
    this.validator, // تمرير الفالديشن
    this.onChanged, // تمرير رد فعل عند التغيير
    this.controller, // تمرير TextEditingController
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // استخدم TextEditingController هنا
      obscureText: widget.type == 'password' ? !passwordVisible : false,
      decoration: InputDecoration(
        suffixIcon: widget.type == 'password'
            ? IconButton(
                icon: passwordVisible
                    ? AppIcons.passwordVisibilityIcon
                    : AppIcons.passwordNotVisibilityIcon,
                onPressed: () {
                  setState(() {
                    passwordVisible =
                        !passwordVisible; // تغيير ظهور كلمة المرور
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
      validator: widget.validator, // إضافة الفالديشن
      onChanged: widget.onChanged, // رد فعل عند تغيير النص
    );
  }
}
