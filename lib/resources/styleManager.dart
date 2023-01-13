
import 'package:flutter/material.dart';
import 'package:movies_app/app/constants.dart';
//this class contains all text style of the app
class StyleManager {
  static TextStyle getRegularStyle(){
    return TextStyle(
      fontFamily: currentLanguage=='ar'?"Cairo":"Roboto",
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle getLightStyle(){
    return TextStyle(
      fontFamily: currentLanguage=='ar'?"Cairo":"Roboto",
      fontWeight: FontWeight.w300,
    );
  }


  static  TextStyle getBoldStyle(){
    return TextStyle(
      fontFamily: currentLanguage=='ar'?"Cairo":"Roboto",
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle getSemiBoldStyle(){
    return TextStyle(
      fontFamily: "Cairo",
      fontWeight: FontWeight.w600,
    );
  }
}