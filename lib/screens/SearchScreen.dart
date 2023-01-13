import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/components/EmptyWidget.dart';
import 'package:movies_app/components/MovieCard.dart';
import 'package:movies_app/components/errorWidget.dart';
import 'package:movies_app/components/searchHistoryCard.dart';
import 'package:movies_app/components/searchTextField.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/providers/searchHistoryProvider.dart';
import 'package:movies_app/providers/searchMoviesProvider.dart';
import 'package:movies_app/resources/sizeManager.dart';
import 'package:provider/provider.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var currentScrollcontroller = ScrollController(initialScrollOffset: 0);

  void currentPagination() {
    if (this.currentScrollcontroller.position.pixels >=
        (this.currentScrollcontroller.position.maxScrollExtent)) {

      Provider.of<SearchMovieProvider>(context,listen: false).paginatingMovie();
    }
  }
  @override
  void initState() {
    currentScrollcontroller.addListener(currentPagination);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 414.sw(),
          height: 740.sh(),
        // color: Colors.red,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.sh()),
            Center(child: SearchTextField()),
            SizedBox(height: 15.sh()),
            Consumer<SearchHistoryProvider>(builder: (context,prov,_){
              if (prov.history.isEmpty){
                return Container(width: 0,height: 0,);
              }
              else{
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.sw()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).lastSearch,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17.sp),),
                      SizedBox(height: 10.sh()),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: prov.history.map<Widget>((e) => SearchHistoryCard(e.toString())).toList(),
                        ),
                      )
                    ],
                  ),
                );
              }
            }),

            SizedBox(height: 20.sh()),

            Consumer<SearchMovieProvider>(
                builder: (context,prov,_){
                  if (prov.state=="loading"){
                    return Expanded(child: Center(child: CircularProgressIndicator(),));
                  }
                  else if (prov.state=="init"){
                    return Container(width: 0,height: 0,);
                  }
                  else if (prov.state=="loaded"){
                    if (prov.searchMoviesModel!.movies!.isEmpty){
                      return Expanded(child: Center(child: CustomeEmptyWidget()));
                    }
                    return Expanded(child:  ListView.builder(
                      controller: this.currentScrollcontroller,
                      itemCount: prov.searchMoviesModel!.movies!.length,
                      itemBuilder: (context,index){
                        return MovieCard(movie:prov.searchMoviesModel!.movies![index]! ,);                                 },
                      padding: EdgeInsets.symmetric(horizontal: 20.sw()),
                      shrinkWrap: true,
                    ));
                  }
                  else if (prov.state=="paginating"){
                    return Expanded(child:  ListView.builder(
                      controller: this.currentScrollcontroller,
                      itemCount: prov.searchMoviesModel!.movies!.length+1,
                      itemBuilder: (context,index){
                        if (index==prov.searchMoviesModel!.movies!.length){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        return MovieCard(movie:prov.searchMoviesModel!.movies![index]! ,);                      },
                      padding: EdgeInsets.symmetric(horizontal: 20.sw()),
                      shrinkWrap: true,
                    ));
                  }
                  else if(prov.state=="error") {
                    return Center(child: CustomeErrorWidget());
                  }
                  else if(prov.state=="loadingError") {
                    return Center(child: CustomeErrorWidget());
                  }
                  else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }),

          ],
        )
      )
    );
  }
}
