import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blocksHorizontal;
  static double? blocksVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    if (_mediaQueryData != null) {
      screenWidth = _mediaQueryData!.size.width;
      screenHeight = _mediaQueryData!.size.height;
      blocksHorizontal = screenWidth! / 100;
      blocksVertical = screenHeight! / 100;
    } else {
      throw FlutterError('MediaQueryData is null. Ensure the context is valid.');
    }
  }
}
