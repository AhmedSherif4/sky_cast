import 'package:flutter/material.dart';

class ResponsiveManager {
  static final window = WidgetsBinding.instance.window;
  static Size size = window.physicalSize / window.devicePixelRatio;

  /// for (right/left) padding and margin, and width.
  static double getHorizontalSize(double px) => px * (size.width / 390);

  /// for (top/bottom) padding and margin, and height.
  static double getVerticalSize(double px) {
    num statusBar = MediaQueryData.fromWindow(window).viewPadding.top;
    num screenHeight = size.height - statusBar;
    return px * (screenHeight / 844);
  }

  /// This method is used to set smallest px in image height and width.
  static double getSize(double px) {
    final height = getVerticalSize(px);
    final width = getHorizontalSize(px);

    if (height < width) {
      return height.toInt().toDouble();
    } else {
      return width.toInt().toDouble();
    }
  }

  /// for text font size.
  static double getFontSize(double px) => getSize(px);
}
