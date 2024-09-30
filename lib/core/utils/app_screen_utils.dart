import 'package:flutter/material.dart';

class ScreenUtil {
  static double getWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  static double getHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }
}
