import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';
import 'package:sit_app/core/utils/app_styles.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({
    super.key,
    required this.size,
    required bool isLoading,
    required this.buttonText,
  }) : _isLoading = isLoading;

  final String buttonText;
  final Size size;
  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.08,
      width: size.width * 0.8,
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
