import 'package:flutter/material.dart';
import 'package:movies_app/components/navBarButtom.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/resources/sizeManager.dart';
//this widger represent the my custome buttom nav bar with 3 tabs and will be in the top of stack in MainScreen Widget
class NavBar extends StatefulWidget {
  Function onChange;
   NavBar({required this.onChange});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int current=0;
  @override
  Widget build(BuildContext context) {
    return Container(

      width:380.sw() ,
      height: 90.sh(),
      padding: EdgeInsets.symmetric(horizontal: 40.sw()),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: NavBarButton(this.current==0, Icons.home_filled, S.of(context).discover),
            onTap: (){
                this.current=0;
                widget.onChange(0);
                setState((){});
            },
          ),
          Spacer(),
          GestureDetector(
            child: NavBarButton(this.current==1, Icons.search_sharp, S.of(context).search),
            onTap: (){
              this.current=1;
              widget.onChange(1);
              setState((){});
            },
          ),
          Spacer(),
          GestureDetector(
            child: NavBarButton(this.current==2, Icons.settings, S.of(context).setting),
            onTap: (){
              widget.onChange(2);
              this.current=2;
              setState((){});
            },
          )
        ],
      ),
    );
  }
}
