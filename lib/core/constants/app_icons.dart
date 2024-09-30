import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sit_app/core/constants/app_colors.dart';

class AppIcons {
  //
  static const double iconSize = 18.0;
  static const double passwordIconSize = 24.0;

  //
  static const Icon logInMailIcon = Icon(FontAwesomeIcons.solidEnvelope,
      size: iconSize, color: AppColors.iconColor);
  //
  static const Icon logInPasswordIcon =
      Icon(FontAwesomeIcons.lock, size: iconSize, color: AppColors.iconColor);
  //
  static const Icon passwordVisibilityIcon = Icon(Icons.visibility,
      size: passwordIconSize, color: AppColors.iconColor);
  //
  static const Icon passwordNotVisibilityIcon = Icon(Icons.visibility_off,
      size: passwordIconSize, color: AppColors.iconColor);
}
