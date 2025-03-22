import 'package:flutter/material.dart';

class ResponsiveWidget {
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static double getResponsiveFontSize(BuildContext context) {
    if (isSmallScreen(context)) {
      return 16;
    } else if (isMediumScreen(context)) {
      return 20;
    } else {
      return 24;
    }
  }

  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isSmallScreen(context)) {
      return EdgeInsets.all(16);
    } else if (isMediumScreen(context)) {
      return EdgeInsets.all(24);
    } else {
      return EdgeInsets.all(32);
    }
  }
}