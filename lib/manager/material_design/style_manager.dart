import 'package:flutter/material.dart';


import 'color_manager.dart';
import 'font_manager.dart';

class StyleManager {

  TextStyle _getTextStyle({
    Color? color,
    double? fontSize,
    required fontWeight,
  }) {
    Color defaultColor = ColorManager.black;

    return TextStyle(
        color: color ?? defaultColor,
        fontSize: fontSize ?? FontSize.s16,
        fontWeight: fontWeight,
        fontFamily: FontConstants.englishFontFamily);
  }

  TextStyle getRegularStyle({
    Color? color,
    double? fontSize,
  }) {
    return _getTextStyle(
        color: color,
        fontWeight: FontWeightManager.regular,
        fontSize: fontSize);
  }

  TextStyle getBoldStyle({
    Color? color,
    double? fontSize,
  }) {
    return _getTextStyle(
        color: color, fontWeight: FontWeightManager.bold, fontSize: fontSize);
  }

  TextStyle getMediumStyle({
    Color? color,
    double? fontSize,
  }) {
    return _getTextStyle(
        color: color, fontWeight: FontWeightManager.medium, fontSize: fontSize);
  }

  TextStyle getSemiBoldStyle({
    Color? color,
    double? fontSize,
  }) {
    return _getTextStyle(
        color: color,
        fontWeight: FontWeightManager.semiBold,
        fontSize: fontSize);
  }

  TextStyle getLightStyle({
    Color? color,
    double? fontSize,
  }) {
    return _getTextStyle(
        color: color, fontWeight: FontWeightManager.light, fontSize: fontSize);
  }
}
