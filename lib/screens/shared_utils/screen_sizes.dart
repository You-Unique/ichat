import 'package:flutter/material.dart';

class ScreenSizes {
  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Orientation orientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  static String screenType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 'Phone';
    if (width < 900) return 'Tablet';
    return 'Desktop';
  }
}
