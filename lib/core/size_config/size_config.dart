import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;

  static late MediaQueryData textScaleFactor;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;

    textScaleFactor = MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling);
  }

  // Convenience methods
  static double getWidth(double percentage) => blockWidth * percentage;
  static double getHeight(double percentage) => blockHeight * percentage;
}
