import 'package:flutter/material.dart';
import 'package:sit_app/core/constants/app_colors.dart';

abstract class AppStyles {
  //.

  //styleSemiBold22..
  static const TextStyle styleSemiBold22 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 22,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  //styleSemiBold30..
  static const TextStyle styleSemiBold30 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 30,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  //styleReguler16..
  static const TextStyle styleReguler16 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  //styleLight14..
  static const TextStyle styleLight14 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
  );
}
