import 'package:flutter/material.dart';
import 'package:reg_app/presentation/resources/styles_manager.dart';
import 'package:reg_app/presentation/resources/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryOpacity70,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
    //Card Theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      shadowColor: ColorManager.primaryOpacity70,
      elevation: AppSize.s4,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.primaryOpacity70,
      buttonColor: ColorManager.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
        ),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      headline1: getBoldStyle(color: ColorManager.black),
      subtitle1: getSemiBoldStyle(color: ColorManager.black),
      subtitle2:
          getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      caption: getLightStyle(color: ColorManager.grey),
      bodyText1: getRegularStyle(color: ColorManager.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
  //Accent Color is replaced with Color Scheme
}
