import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/constants.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/providers/languageProvider.dart';
import 'package:movies_app/providers/themeProvider.dart';
import 'package:movies_app/screens/mainScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../resources/themeManager.dart';
// App class represent the widget which will contain my MaterialApp

BuildContext? appContext;

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext contextt) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //we will add here Consumer of LangProvider so it can listen to any change in to any change of language and update the language of all app
    return Consumer<LangProvider>(builder: (context, prov, _) {
      //we will add here ChangeNotifierProvider of ThemeProvider so it can listen to any change bewteen light mode and dark mode
      return ChangeNotifierProvider(
          create: (context) => ThemeProvider()..initTheme(),
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeProvider>(context);

            return MaterialApp(
              themeMode: themeProvider.themeMode,
              theme: themeProvider.isDarkMode?MyThemes.darkTheme:MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                S.delegate
              ],
              locale: Locale(currentLanguage),
              supportedLocales: S.delegate.supportedLocales,
              home: Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (context) => Directionality(
                        textDirection: currentLanguage == 'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: MainPage()),
                  ),
                ],
              ),
              builder: (context, w) {
                ScreenUtil.init(context, designSize: Size(375, 812));
                //here we set appContext variable to the context of MaterialApp builder
                // which have a mediaQuery object and we will use it in our size manager class to make responsive design
                appContext = context;

                return w!;
              },
            );
          });
    });
  }
}
