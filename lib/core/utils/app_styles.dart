import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';

abstract class AppStyles {
  //.

  //styleSemiBold20W500..
  static const TextStyle styleSemiBold20W500 = TextStyle(
    color: AppColors.whaiteBackgroundColor,
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  //styleSemiBold20W600 ..
  static const TextStyle styleSemiBold20W600 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

 //styleSemiBold16..
  static const TextStyle styleSemiBold16 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  //styleSemiBold18..
  static const TextStyle styleSemiBold18 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  //styleSemiBold22..
  static const TextStyle styleSemiBold22 = TextStyle(
    color: AppColors.whaiteBackgroundColor,
    fontSize: 22,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  //styleSemiBold26..
  static const TextStyle styleSemiBold26 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 26,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  //styleReguler16..
  static const TextStyle styleReguler13 = TextStyle(
    color: AppColors.accentColor,
    fontSize: 13,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  //styleLight12..
  static const TextStyle styleLight12 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
  );
}
