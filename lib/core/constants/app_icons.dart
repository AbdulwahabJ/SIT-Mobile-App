import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sit_app/core/constants/app_colors.dart';

class AppIcons {
  //
  static const double iconSize = 18.0;
  static const double secondIconSize = 20.0;
  static const double thirdIconSize = 30.0;

  //sign in screen   ###########
  static const Icon mailIcon = Icon(FontAwesomeIcons.solidEnvelope,
      size: secondIconSize, color: AppColors.iconColor);
  //
  static const Icon passwordIcon =
      Icon(FontAwesomeIcons.lock, size: iconSize, color: AppColors.iconColor);
  //
  static const Icon passwordVisibilityIcon =
      Icon(Icons.visibility, size: 30, color: AppColors.iconColor);
  //
  static const Icon passwordNotVisibilityIcon =
      Icon(Icons.visibility_off, size: 26, color: AppColors.iconColor);
  // sign in screen   ###########
//
  // sign up screen ###########
  static const Icon fullNameIcon =
      Icon(Icons.account_circle, size: 28, color: AppColors.iconColor);

  static const Icon dropDownMenuIcon = Icon(Icons.arrow_drop_down,
      size: thirdIconSize, color: AppColors.iconColor);

  static const Icon phoneIcon =
      Icon(Icons.phone, size: 24, color: AppColors.iconColor);

  static const Icon groupIcon =
      Icon(Icons.groups_2_rounded, size: 25, color: AppColors.iconColor);
  static const Icon programIcon =
      Icon(Icons.list_alt, size: 28, color: AppColors.accentColor);
  static const Icon programFieldIcon =
      Icon(Icons.list_alt, size: 24, color: AppColors.primaryColor);
  //
  static const Icon backIcon =
      Icon(Icons.arrow_back_rounded, size: 28, color: AppColors.iconColor);
  // sign up screen ###########

  //
  //
  static const Icon successIcon =
      Icon(Icons.check_circle, size: 24, color: AppColors.successColor);
  //
  //bottom nav bar icons
  static const Icon homeIcon =
      Icon(FontAwesomeIcons.house, size: secondIconSize);
  //
  static const Icon staffIcon = Icon(Icons.group, size: 24);
  //
  static const Icon momenstIcon =
      Icon(FontAwesomeIcons.bookmark, size: secondIconSize);
  //
  //app bar icons
  static const Icon drawerIcon =
      Icon(Icons.menu, size: thirdIconSize, color: AppColors.primaryColor);
  //
  static const Icon langugeIcon =
      Icon(Icons.language, size: 28, color: AppColors.primaryColor);
  //
  static Icon settingsIcon = const Icon(Icons.settings_outlined,
      size: thirdIconSize, color: AppColors.accentColor);
  //
  static Icon supportIcon = const Icon(Icons.headset_mic_outlined,
      size: thirdIconSize, color: AppColors.accentColor);
  //
  static Icon signOutIcon = const Icon(Icons.logout_rounded,
      size: thirdIconSize, color: AppColors.accentColor);
  //
  //guide list icons
  static const Icon guideListIcon = Icon(Icons.arrow_forward_rounded,
      size: 22, color: AppColors.whaiteBackgroundColor);

  //staff screen icons
  static Icon staffSendIcon =
      const Icon(Icons.send_sharp, size: 22, color: AppColors.primaryColor);
  static Icon staffAddIcon = const Icon(
    Icons.person_add_alt_1,
    size: 28,
    color: AppColors.primaryColor,
  );
  static const Icon photoMemberIcon =
      Icon(Icons.photo_camera_front_outlined, color: AppColors.primaryColor);
  static const Icon uploadImage =
      Icon(Icons.file_upload_outlined, color: AppColors.primaryColor);

  //settings admin screen icons
  static const Icon groupAdminIcon =
      Icon(Icons.groups_2_rounded, size: 28, color: AppColors.accentColor);
  static const Icon addAdminIcon = Icon(Icons.add_circle_outline,
      size: 24, color: AppColors.blueAddIconColor);
  static const Icon editAdminIcon =
      Icon(Icons.edit, size: 24, color: AppColors.yellowEditIconColor);
  static const Icon deleteAdminIcon =
      Icon(Icons.delete, size: 24, color: AppColors.deleteIconColor);

  //
  static const Icon addMomentIcon =
      Icon(Icons.add_circle_outline, size: 30, color: AppColors.primaryColor);
}
