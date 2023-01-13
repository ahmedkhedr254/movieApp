import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/providers/searchHistoryProvider.dart';
import 'package:movies_app/providers/searchMoviesProvider.dart';
import 'package:movies_app/resources/sizeManager.dart';
import 'package:provider/provider.dart';
//this widget represent the textfield of movie search
class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 366.sw(),
     // height: 54.sh(),
      child: TextField(
        scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom ),
        onTap: (){},
        onSubmitted: (val){
          //here we will call getSearchMovie from SearchMovieProvider to get the movie list
          // of search from server and add this list to the  movies list in my SearchMovieProvider class
          //and notifyListener to update all consumer listening to SearchMovieProvider

          //here we will call addHistory from SearchHistoryProvider to add this search
          // to searchHistory in sharedpreferences
          //and notifyListener to update all consumer listening to SearchHistoryProvider
          if(val!=''){
            Provider.of<SearchMovieProvider>(context,listen: false).getSearchMovie(val);
            Provider.of<SearchHistoryProvider>(context,listen: false).addHistory(val);
          }
        },

          //controller: TextEditingController(),
        decoration: InputDecoration(
          hintText: S.of(context).search,
          contentPadding: EdgeInsets.symmetric(vertical: 5.sh()),
          prefixIcon: Icon(Icons.search),
          // suffixIcon:  Icon(Icons.mic_outlined,size: 20.sw(),color: Theme.of(context).backgroundColor,),
          filled: true,
          fillColor: Theme.of(context).cardColor,

          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white.withOpacity(.0))
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: BorderSide(color: Colors.white.withOpacity(.1))

          ),

        ),
      ),
    );
  }
}
