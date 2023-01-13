import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
//this ChangeNotifier is the provider of Themeof the app which will controll the logic of theme

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  //in this method we will check pref.getBool('darkMode') is null so its first time to run the app we will set the themeMode to the themeMode of the mobile system
  //if pref.getBool('darkMode') in cache is true we will set themeMode to dark else it will be light
  initTheme()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    if(pref.getBool('darkMode')==null){
      themeMode = ThemeMode.system;
    }
    else{
      if (pref.getBool('darkMode')!){
        themeMode = ThemeMode.dark;
      }
      else{
        themeMode = ThemeMode.light;
      }
    }
    notifyListeners();
  }
  //in this method we will check if we now in dark or light mode using SchedulerBinding
  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }
  //in this method we will toggleTheme between dark and light by update the SharedPreferences and notifyListeners so the consumer in App class will update the mode of all app

  void toggleTheme(bool isOn)async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setBool('darkMode', isOn);
    notifyListeners();
  }
}