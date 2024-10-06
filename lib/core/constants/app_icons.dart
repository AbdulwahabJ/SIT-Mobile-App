import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sit_app/core/constants/app_colors.dart';

class AppIcons {
  //
  static const double iconSize = 18.0;
  static const double secondIconSize = 20.0;
  static const double thirdIconSize = 34.0;

  //sign in screen   ###########
  static const Icon mailIcon = Icon(FontAwesomeIcons.solidEnvelope,
      size: 16, color: AppColors.iconColor);
  //
  static const Icon passwordIcon =
      Icon(FontAwesomeIcons.lock, size: 16, color: AppColors.iconColor);
  //
  static const Icon passwordVisibilityIcon =
      Icon(Icons.visibility, size: secondIconSize, color: AppColors.iconColor);
  //
  static const Icon passwordNotVisibilityIcon = Icon(Icons.visibility_off,
      size: secondIconSize, color: AppColors.iconColor);
  // sign in screen   ###########
//
  // sign up screen ###########
  static const Icon fullNameIcon =
      Icon(Icons.account_circle, size: iconSize, color: AppColors.iconColor);

  static const Icon dropDownMenuIcon =
      Icon(Icons.arrow_drop_down, size: iconSize, color: AppColors.iconColor);

  static const Icon phoneIcon =
      Icon(Icons.phone, size: secondIconSize, color: AppColors.iconColor);

  static const Icon groupIcon = Icon(Icons.groups_2_rounded,
      size: secondIconSize, color: AppColors.iconColor);
  //
  static const Icon backIcon =
      Icon(Icons.arrow_back_rounded, size: 28, color: AppColors.iconColor);
  // sign up screen ###########

//
  //
  static const Icon successIcon = Icon(Icons.check_circle,
      size: thirdIconSize, color: AppColors.successColor);
}
