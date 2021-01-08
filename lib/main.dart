import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/intro_page.dart';

import 'core/provider/providers.dart';
import 'core/routes/route_names.dart';
import 'ui_helpers/themes/app_theme_light.dart';
//import 'package:firebase_core/firebase_core.dart';
//  const MaterialColor primaryColor = MaterialColor(0xff9477cb,{});


void main() async{
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set default display Orientation to Potrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
       statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    
    ));
    return MultiProvider(
      providers: SaloneyProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Saloney',
        theme: appThemeLight,
        routes: RouteNames.routes,
        initialRoute: RouteNames.introPage,
      ),
    );
  }
}
