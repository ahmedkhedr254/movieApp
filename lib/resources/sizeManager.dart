import 'package:flutter/cupertino.dart';
import 'package:movies_app/app/myApp.dart';
//we will create extensions for double and int called sw() and sh() and it will replace
// the  value of the int or double values with its corresponding value in case of of screen with 414 wdith and 896 height
//for example you got a xd design file with screens with 896 height and 414 wdith
extension NumberParsingg on double {
  double  sw() {
    return MediaQuery
        .of(appContext!)
        .size
        .width * (this / 414.0);
  }

  double sh() {
    return MediaQuery.of(appContext!).size.height * (this / 896.0);
  }



}

extension NumberParsing on int {
  double  sw() {
    return MediaQuery
        .of(appContext!)
        .size
        .width* (this / 414.0);
  }

  double sh() {
    return MediaQuery.of(appContext!).size.height * (this / 896.0);

  }


}