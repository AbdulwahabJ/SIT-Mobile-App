import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/utils/app_styles.dart';
import '../../../../../core/utils/app_screen_utils.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({
    super.key,
    required bool isLoading,
    required this.buttonText,
  }) : _isLoading = isLoading;

  final String buttonText;
  final bool _isLoading;

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
              buttonText,
              style: AppStyles.styleSemiBold22,
            ),
            const SizedBox(width: 10),
            // عرض الـ CircularProgressIndicator فقط إذا كان _isLoading true
            if (_isLoading)
              const CircularProgressIndicator(
                color: AppColors.accentColor,
                strokeWidth: 2,
              ),
          ],
        ),
      ),
    );
  }
}
