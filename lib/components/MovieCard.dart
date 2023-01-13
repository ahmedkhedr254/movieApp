import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/resources/sizeManager.dart';

import '../models/MovieModel.dart';
import '../screens/detailScreen.dart';
//this card represent the movies with image , title ,description and date
class MovieCard extends StatelessWidget{
  var inputFormat = DateFormat('dd/MM/yyyy');

  final MovieModel movie;
   MovieCard({ required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return DetailScreen(movie: this.movie,);
        }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.sh()),
        width:380.sw() ,
        // height: 140.sh(),
        padding: EdgeInsets.symmetric(horizontal: 10.sw(),vertical: 10.sh()),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width:130.sw() ,
              height: 200.sh(),
              child: ClipRRect(child: this.movie.posterPath==null?Image.asset('assets/images/holderImage.png',fit: BoxFit.contain):Image.network("https://www.themoviedb.org/t/p/w220_and_h330_face${this.movie.posterPath}",fit: BoxFit.contain,),borderRadius: BorderRadius.circular(20),),
            ),
            SizedBox(width: 20.sw(),),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.sh(),),
                  Text(this.movie.title??"",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16.sp),),
                  SizedBox(height: 10.sh(),),
                  Text(this.movie.overview!.length>200?this.movie.overview!.substring(0,200)+"...":this.movie.overview!,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp),),
                  SizedBox(height: 10.sh(),),
                  this.movie.releaseDate==null?Container(width: 0,height: 0,):Row(
                    children: [
                      Icon(Icons.calendar_month,color: Theme.of(context).hintColor,),
                      SizedBox(width: 5.sw(),),
                      Text(inputFormat.format(this.movie.releaseDate!),style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14.sp),),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
