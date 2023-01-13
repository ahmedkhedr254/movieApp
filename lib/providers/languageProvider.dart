import 'package:flutter/material.dart';
import 'package:movies_app/app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../generated/l10n.dart';
//this ChangeNotifier is the provider of language of the app which will controll the logic of language

class LangProvider with ChangeNotifier{
  String currentLang=currentLanguage;
  //in this method we will toggleTheme between english and arabic by update the SharedPreferences and the current locale of intl package and notifyListeners so the consumer in App class will update the language of all app

  changeLanguage(String lang)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
      this.currentLang=lang;
       currentLanguage=lang;
      await S.load(Locale(lang));
      pref.setString("lang", lang);
      notifyListeners();

  }
}