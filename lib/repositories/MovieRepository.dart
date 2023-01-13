import 'package:http/http.dart';
import 'package:movies_app/app/constants.dart';
//this class will contain all method which responsible to get the json result form end point
class MovieRepository{
   //the following method will return the response of discover/movie endpoint
   getDiscoverMovies(int page,String lang)async{
     var header={
       'Authorization': 'Bearer $authToken',
     };
    Response response = await get(Uri.parse("${serverUrl}/3/discover/movie?language=$lang&page=$page"),headers: header);
    return response;

  }
   //the following method will return the response of discover/search/movie

   getSearchMovies(int page,String lang,String query)async{
     var header={
       'Authorization': 'Bearer $authToken',
     };
     Response response = await get(Uri.parse("${serverUrl}/3/search/movie?language=$lang&page=$page&include_adult=false&query=$query"),headers: header);
     return response;
   }
}