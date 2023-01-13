import 'package:flutter/material.dart';
import 'package:movies_app/app/constants.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/providers/discoverMoviesProvider.dart';
import 'package:movies_app/providers/languageProvider.dart';
import 'package:movies_app/providers/themeProvider.dart';
import 'package:movies_app/resources/sizeManager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sw()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.dark_mode,
                size: 50.sw(),
              ),
              Row(
                children: [
                  Text(
                    S.of(context).darkMode,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16.sp),
                  ),
                  Switch(
                    // This bool value toggles the switch.
                    value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      Provider.of<ThemeProvider>(context,listen: false).toggleTheme(! Provider.of<ThemeProvider>(context,listen: false).isDarkMode);
                    },
                  )
                ],
              )

            ],
          ),
          SizedBox(height: 20.sh(),),

          Row(
            children: [
              Icon(
                Icons.language,
                size: 50.sw(),
              ),
              Row(
                children: [
                  Text(
                    S.of(context).language,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(width: 10.sw(),),
                  DropdownButton(
                      value: currentLanguage,
                      onTap: (){},
                      items: ['en','ar'].map<DropdownMenuItem<String>>((String v) {
                        return DropdownMenuItem<String>(
                          value: v,
                          child: Text(v),
                        );
                      }).toList(),
                      onChanged: (lang)async{
                        await S.load(Locale("ar_eg"));
                        await Provider.of<LangProvider>(context,listen: false).changeLanguage(lang.toString());
                        await Provider.of<DiscoverMoviesProvider>(context,listen: false).initMovie();


                      }
                  )
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
