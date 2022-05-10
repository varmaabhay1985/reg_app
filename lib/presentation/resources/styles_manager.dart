import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.regular, color);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.light, color);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.medium, color);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s24, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.semiBold, color);
}

TextStyle getBoldStyle({double fontSize = FontSize.s32, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.bold, color);
}
