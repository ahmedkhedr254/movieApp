import 'package:flutter/material.dart';
import 'package:movies_app/app/constants.dart';
import 'package:movies_app/providers/discoverMoviesProvider.dart';
import 'package:movies_app/providers/languageProvider.dart';
import 'package:movies_app/providers/searchHistoryProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/myApp.dart';

//main fuction to run the app
void main() async {
  WidgetsFlutterBinding();
  SharedPreferences pref = await SharedPreferences.getInstance();
  //set current language to english if its first time to open the app and the value of pref.getString("lang") is set to null
  currentLanguage = pref.getString("lang") ?? "en";

  //add MultiProvider of (LangProvider,DiscoverMoviesProvider,SearchHistoryProvider)
  // as a parent widget to my app to be able to access the data of these providers from anywhere in my app
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: LangProvider()),
    ChangeNotifierProvider.value(value: DiscoverMoviesProvider()..initMovie()),
    ChangeNotifierProvider.value(value: SearchHistoryProvider()..getHistory())
  ], child: App()));
}
