import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/models/MovieModel.dart';
import 'package:movies_app/resources/sizeManager.dart';
var inputFormat = DateFormat('dd/MM/yyyy');

class DetailScreen extends StatefulWidget {
  final MovieModel movie;

  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailScreen> createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen>  {

  @override
  Widget build(BuildContext context) {
    const bannerHigh = 200.0;

    return Scaffold(

      body: SafeArea(
        child: Container(
          color: Colors.grey.withOpacity(.05),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                leading: IconButton(
                  onPressed: () => {Navigator.pop(context)},
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          48,
                        ),
                      ),
                    ),
                    child:  Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),

                expandedHeight: 500.sh(),
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  background:widget.movie.backdropPath==null?Image.asset('assets/images/holderImage.png',fit: BoxFit.fill):Image.network("https://www.themoviedb.org/t/p/w220_and_h330_face${widget.movie.backdropPath}",fit: BoxFit.fill,),

    stretchModes: const [
                    StretchMode.zoomBackground,
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(20.sw()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              widget.movie.title??"",
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18.sp) ,
                            ),
                          ),
                          SizedBox(height: 5.sh()),
                          widget.movie.releaseDate==null?Container(width: 0,height: 0,):Row(
                            children: [
                              Icon(Icons.calendar_month,color: Theme.of(context).hintColor,),
                              SizedBox(width: 5.sw(),),
                              Text(inputFormat.format(widget.movie.releaseDate!),style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 18.sp),),

                            ],
                          ),
                          SizedBox(height: 20.sh()),
                          Text(widget.movie.overview!,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22.sp),),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
