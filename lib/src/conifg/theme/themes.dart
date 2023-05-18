// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:social_app_intern/src/conifg/theme/colorManger.dart';

import 'package:social_app_intern/src/conifg/theme/font_manager.dart';
import 'package:social_app_intern/src/conifg/theme/hexcolor.dart';
import 'package:social_app_intern/src/conifg/theme/styles.dart';
import 'package:social_app_intern/src/conifg/theme/valuseManger.dart';

class AppTheme {
  static ThemeData darkTheme() {
    // final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    //   primary: ColorManager.primaryColor,
    // );
    return ThemeData(
      fontFamily: FontConstants.fontFamily,
      appBarTheme: AppBarTheme(color: Colors.grey[700]),
      popupMenuTheme: const PopupMenuThemeData(color: Colors.black),
      iconTheme: const IconThemeData(color: Colors.white),
      primaryColor: ColorManager.primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: ColorManager.canvasColor,
      backgroundColor: ColorManager.BackgroundColorDark,
      scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColorDark,
      shadowColor: ColorManager.shadowColor,
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      //cursorColor: primaryColor,
      textTheme: textTheme(),
      primaryTextTheme: textTheme(),
      platform: TargetPlatform.iOS,
      disabledColor: Colors.black.withOpacity(0.4),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: ColorManager.scaffoldBackgroundColor,
                  fontSize: FontSize.s17),
              primary: ColorManager.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: ColorManager.primaryColor)),
      fontFamily: FontConstants.fontFamily,
      appBarTheme: AppBarTheme(color: HexColor("#F0F3F8")),
      popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
      iconTheme: const IconThemeData(color: Color(0xff2b2b2b)),
      primaryColor: ColorManager.primaryColor,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
      backgroundColor: Colors.white,
      errorColor: Colors.red,
      //   buttonColor: Color(primaryColor),
      textTheme: textTheme(),
      primaryTextTheme: textTheme(),
      platform: TargetPlatform.iOS,
      shadowColor: Colors.black,
      indicatorColor: ColorManager.primaryColor,
      disabledColor: Colors.black.withOpacity(0.1),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: ColorManager.scaffoldBackgroundColor,
                  fontSize: FontSize.s17),
              primary: ColorManager.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),

      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorManager.textFormFiledColor,
          // content padding
          contentPadding: const EdgeInsets.all(AppPadding.p8),
          // hint style
          hintStyle: getRegularStyle(
              color: ColorManager.TexttextFormFiledColor,
              fontSize: FontSize.s14),
          labelStyle: getMediumStyle(
              color: ColorManager.TexttextFormFiledColor,
              fontSize: FontSize.s14),
          errorStyle: getRegularStyle(color: ColorManager.error),

          // enabled border style
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.textFormFiledColor, width: AppSize.s1_5),
              borderRadius: BorderRadius.circular(AppSize.s12)),

          // focused border style
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.primaryColor, width: AppSize.s1_5),
              borderRadius: BorderRadius.circular(AppSize.s12)),

          // error border style
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.error, width: AppSize.s1_5),
              borderRadius: BorderRadius.circular(AppSize.s12)),
          // focused border style
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorManager.primaryColor, width: AppSize.s1_5),
              borderRadius: BorderRadius.circular(AppSize.s12))),
      // label style
    );
  }

  static TextTheme textTheme() {
    return TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.TextColor, fontSize: FontSize.s22),
        headlineLarge: getRegularStyle(color: HexColor('#95959D')),
        headlineMedium: getRegularStyle(
            color: ColorManager.TextColor, fontSize: FontSize.s14),
        titleMedium: getMediumStyle(
            color: ColorManager.TextColor, fontSize: FontSize.s16),
        bodyLarge: getSemiBoldStyle(
          color: ColorManager.TextColor,
        ),
        bodySmall: getSemiBoldStyle(color: ColorManager.TextColor));
  }
}
