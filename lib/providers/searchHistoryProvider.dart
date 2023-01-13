import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SearchHistoryProvider with ChangeNotifier{
  List<String> history=[];
  getHistory()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    if(pref.getStringList("searchHistory")==null){
      pref.setStringList("searchHistory", []);
    }
    history=pref.getStringList("searchHistory")!;
    notifyListeners();

  }
  addHistory(String val)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    if(pref.getStringList("searchHistory")==null){
      pref.setStringList("searchHistory", []);
    }
    history=history..add(val);
    pref.setStringList("searchHistory", history);
    notifyListeners();

  }

}