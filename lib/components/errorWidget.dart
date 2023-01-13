import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/resources/sizeManager.dart';
//the following widget will be rendered when we have some error while retriving the date
class CustomeErrorWidget extends StatelessWidget {
  const CustomeErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(Icons.error,color: Colors.red,size: 50.sw(),),
        SizedBox(height: 5.sh(),),
        Text(S.of(context).errorMessage,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize:16.sp ),)
      ],),
    );
  }
}
