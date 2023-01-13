import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/resources/sizeManager.dart';
//this widget represent the buttom of every tab of nav bar
class NavBarButton extends StatelessWidget {
  bool isActive;
  IconData icon;
  String text;
   NavBarButton(this.isActive,this.icon,this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.sw()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: this.isActive?Theme.of(context).primaryColor:Theme.of(context).textTheme.headline1!.color,size: 20.sw(),),
          SizedBox(height: 1.sh(),),
          Text(this.text,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16.sp,color: this.isActive?Theme.of(context).primaryColor:Theme.of(context).textTheme.headline1!.color,),)
        ],
      ),
    );
  }
}
