import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/components/MovieCard.dart';
import 'package:movies_app/components/errorWidget.dart';
import 'package:movies_app/providers/discoverMoviesProvider.dart';
import 'package:movies_app/resources/sizeManager.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  var currentScrollcontroller = ScrollController(initialScrollOffset: 0);

  void currentPagination() {
    if (this.currentScrollcontroller.position.pixels >=
        (this.currentScrollcontroller.position.maxScrollExtent)) {

      Provider.of<DiscoverMoviesProvider>(context,listen: false).paginatingMovie();
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
        child:  Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.sh()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 30.sw()),
                Container(width: 60.sw(),height: 60.sw(),child: Image.asset('assets/images/logo.png',fit: BoxFit.fill,),),
                SizedBox(width: 10.sw()),
                Text(S.of(context).discover,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 25.sp, fontWeight: FontWeight.w600,),)
              ],
            ),
            SizedBox(height: 20.sh()),
            Consumer<DiscoverMoviesProvider>(builder: (context,prov,_){
                if (prov.state=="loading"){
                  return Expanded(child: Center(child: CircularProgressIndicator(),));
                }
                else if (prov.state=="loaded"){
                  return Expanded(child:  ListView.builder(
                    controller: this.currentScrollcontroller,
                    itemCount: prov.discoverMoviesModel!.movies!.length,
                    itemBuilder: (context,index){
                      return MovieCard(movie:prov.discoverMoviesModel!.movies![index]! ,);                    },
                    padding: EdgeInsets.symmetric(horizontal: 20.sw()),
                    shrinkWrap: true,
                  ));
                }
                else if (prov.state=="paginating"){
                  return Expanded(child:  ListView.builder(
                    controller: this.currentScrollcontroller,
                    itemCount: prov.discoverMoviesModel!.movies!.length+1,
                    itemBuilder: (context,index){
                      if (index==prov.discoverMoviesModel!.movies!.length){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return MovieCard(movie:prov.discoverMoviesModel!.movies![index]! ,);
                    },
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
        ),
      ),
    );
  }
}
