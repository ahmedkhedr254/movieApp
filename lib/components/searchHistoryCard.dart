import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/providers/searchMoviesProvider.dart';
import 'package:movies_app/resources/sizeManager.dart';
import 'package:provider/provider.dart';
//this card represent the the card which will contain the text of search history
class SearchHistoryCard extends StatelessWidget {
  String text;
   SearchHistoryCard(this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        Provider.of<SearchMovieProvider>(context,listen: false).getSearchMovie(text);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.sw()),
        // height: 140.sh(),
        padding: EdgeInsets.symmetric(horizontal: 10.sw(),vertical: 6.sh()),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.01),
              spreadRadius: 10,
              blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(this.text,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp),)
            ,
        ),
      ),
    );
  }
}
