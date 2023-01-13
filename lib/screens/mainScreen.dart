

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/components/navBar.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/providers/searchMoviesProvider.dart';
import 'package:movies_app/resources/sizeManager.dart';
import 'package:movies_app/screens/DiscoverScreen.dart';
import 'package:movies_app/screens/SearchScreen.dart';
import 'package:movies_app/screens/SettingScreen.dart';
import 'package:provider/provider.dart';

import '../app/constants.dart';

class MainPage extends StatefulWidget {
  MainPage();

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int currentIndex = 0;


  //current widget represnt the widget which will render in screen after set the current index from navbar
  Widget currentWidget() {
    if (this.currentIndex == 0) {
      return DiscoverScreen();
    } else if (this.currentIndex == 1) {

      return ChangeNotifierProvider<SearchMovieProvider>(
        create: (context) => SearchMovieProvider(),
        child:SearchScreen(),

      );
    } else if (this.currentIndex == 2) {
      return SettingScreen();
    }

    else {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();
  }
  @override

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body:Container(
          width: 414.sw(),
          height: 896.sh(),
          child: Stack(
            children: [

              Positioned(child: NavBar(onChange: (index){

                this.currentIndex=index;
                setState((){});
              },),bottom: 10.sh(),left: 17.sw(),),
              currentWidget(),

            ],
          ),
        ),
    );
  }
}
