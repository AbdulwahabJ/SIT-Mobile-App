import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sit_app/core/constants/app_colors.dart';

class AppIcons {
  //
  static const double iconSize = 18.0;
  static const double secondIconSize = 24.0;
  static const double thirdIconSize = 34.0;

  //sign in screen   ###########
  static const Icon logInMailIcon = Icon(FontAwesomeIcons.solidEnvelope,
      size: iconSize, color: AppColors.iconColor);
  //
  static const Icon logInPasswordIcon =
      Icon(FontAwesomeIcons.lock, size: iconSize, color: AppColors.iconColor);
  //
  static const Icon passwordVisibilityIcon =
      Icon(Icons.visibility, size: secondIconSize, color: AppColors.iconColor);
  //
  static const Icon passwordNotVisibilityIcon = Icon(Icons.visibility_off,
      size: secondIconSize, color: AppColors.iconColor);
  // sign in screen   ###########
//
  // sign up screen ###########
  static const Icon fullNameIcon = Icon(Icons.account_circle,
      size: secondIconSize, color: AppColors.iconColor);
  //
  static const Icon codeIcon =
      Icon(Icons.fingerprint, size: secondIconSize, color: AppColors.iconColor);
  //
  static const Icon dropDownMenuIcon = Icon(Icons.arrow_drop_down,
      size: secondIconSize, color: AppColors.iconColor);
  //
  static const Icon backIcon = Icon(Icons.arrow_back_rounded,
      size: thirdIconSize, color: AppColors.iconColor);
}
