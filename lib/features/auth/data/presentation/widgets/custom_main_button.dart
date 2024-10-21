import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/utils/app_screen_utils.dart';

class CustomMainButton extends StatefulWidget {
  const CustomMainButton({
    super.key,
    required this.isLoading,
    this.isSuccess = false,
    required this.buttonText,
  });

  final String buttonText;
  final bool isLoading;
  final bool isSuccess;

  @override
  State<CustomMainButton> createState() => _CustomMainButtonState();
}

class _CustomMainButtonState extends State<CustomMainButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil.getHeight(context, 0.07),
      width: ScreenUtil.getWidth(context, 0.7),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.buttonText,
              style: AppStyles.styleSemiBold22,
            ),
            const SizedBox(width: 10),
            if (widget.isLoading)
              const CircularProgressIndicator(
                color: AppColors.accentColor,
                strokeWidth: 2,
              ),
            if (widget.isSuccess) AppIcons.successIcon, // علامة الصح
          ],
        ),
      ),
    );
  }
}
