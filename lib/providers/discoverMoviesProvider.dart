import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movies_app/app/constants.dart';
import 'package:movies_app/models/discoverMovieModel.dart';
import 'package:movies_app/repositories/MovieRepository.dart';

//this ChangeNotifier is the provider of DiscoverMovies which have state can be (init,loading,loaded,loadingError,error)
class DiscoverMoviesProvider with ChangeNotifier{
  String state="init";
  int currentPage=1;
  DiscoverMovieModel? discoverMoviesModel;
  //the following method will initilize the DiscoverMoviesProvider by set currentpage for pagination with 1 and
  //set the state with loading and notifyListeners so it will make all consumer listening to DiscoverMoviesProvider update its state and render the loading widget
  // and try to get the result of DiscoverMovies endpoint for page 1 if it returned with 200 we will set the class DiscoverMovieModel object to DiscoverMovieModel of
  //DiscoverMovieModelFromJson method of response json and notifyListeners so all consumer listening to DiscoverMoviesProvider update its state to loaded and will show
  //the list view of the movies with page 1
  //if it it returned with any other code we will set the state with loadingError so all consumer listening to DiscoverMoviesProvider will render error widget
  //if error occurred in catch  we will set the state with error so all consumer listening to DiscoverMoviesProvider will render error widget
  initMovie()async{
    currentPage=1;
   try{
      state="loading";
      notifyListeners();
      Response res=await MovieRepository().getDiscoverMovies(currentPage, currentLanguage);
      if (res.statusCode==200||res.statusCode==201){
        state="loaded";
        discoverMoviesModel=DiscoverMovieModelFromJson(res.body);
        notifyListeners();
      }
      else{
        state="loadingError";
        notifyListeners();
      }
    }
    catch(e){
      state="error";
    }


  }
  //the following method will paginating the DiscoverMoviesProvider by increase currentpage variable with one  and
  //set the state with paginating and notifyListeners so it will make all consumer listening to DiscoverMoviesProvider update its state and render the loading widget at
  //the buttom of the previous listview untill we get the data from endpoint
  // and try to get the result of DiscoverMovies endpoint for new page if it returned with 200 we will add the result list to the movies list of the
  //  object  discoverMoviesModel and notifyListeners so all consumer listening to DiscoverMoviesProvider update its state to loaded and will show
  //the the new list after adding the new page
  //if it it returned with any other code we will set the state with loaded and decrease the currentPage by 1 to be the old value before this pagination
  // so all consumer listening to DiscoverMoviesProvider will have no change
  //if error occurred in catch  we will set the state with loaded and decrease the currentPage by 1 to be the old value before this pagination
  //so all consumer listening to DiscoverMoviesProvider will have no change

  paginatingMovie()async{
   if(state=="loaded"){
     try{
       state="paginating";
       notifyListeners();
       currentPage=currentPage+1;
       Response res=await MovieRepository().getDiscoverMovies(currentPage, currentLanguage);
       if (res.statusCode==200||res.statusCode==201){
         state="loaded";
         DiscoverMovieModel? model=DiscoverMovieModelFromJson(res.body);
         discoverMoviesModel!.movies=discoverMoviesModel!.movies!..addAll(model!.movies!);
         notifyListeners();
       }
       else{
         currentPage=currentPage-1;
         state="loaded";
         notifyListeners();
       }
     }
     catch(e){
       currentPage=currentPage-1;
       state="loaded";
       notifyListeners();

     }
   }
  }
}