

import 'package:flutter/material.dart';
import 'package:movies_app/resources/styleManager.dart';

import 'colorManager.dart';
//this class contains all themes of the app
class MyThemes {

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.darkBackgroundColor,

    primaryColor:ColorManager.darkPrimaryColor ,
    backgroundColor:ColorManager.darkBackgroundColor ,
    canvasColor:  ColorManager.darkCardColor,
    iconTheme: IconThemeData(color: ColorManager.darkPrimaryColor, opacity: 0.8),
    cardColor: ColorManager.darkCardColor,
    brightness:Brightness.dark,
    textTheme: TextTheme(
      headline1: StyleManager.getBoldStyle().copyWith(color: ColorManager.darkTextColor),
      bodyText1:StyleManager.getRegularStyle().copyWith(color: ColorManager.darkTextColor) ,
      labelMedium: StyleManager.getRegularStyle().copyWith(color: ColorManager.darkHintColor),
    ),





  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.lightBackgroundColor,
    primaryColor:ColorManager.lightPrimaryColor ,
    backgroundColor:ColorManager.lightBackgroundColor ,
    canvasColor:  ColorManager.lightCardColor,
    iconTheme: IconThemeData(color: ColorManager.lightPrimaryColor, opacity: 0.8),
    cardColor: ColorManager.lightCardColor,
    brightness:Brightness.light,
    
    textTheme: TextTheme(
      headline1: StyleManager.getBoldStyle().copyWith(color: ColorManager.lightTextColor),
      bodyText1:StyleManager.getRegularStyle().copyWith(color: ColorManager.lightTextColor) ,
      labelMedium: StyleManager.getRegularStyle().copyWith(color: ColorManager.lightHintColor),
    ),
  );


}
