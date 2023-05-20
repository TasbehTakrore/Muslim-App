// ignore_for_file: prefer_const_constructors

import 'package:alquramcommunity_frontend/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:alquramcommunity_frontend/view/screen/homescreen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/constant/color.dart';
import 'core/localization/changelocal.dart';
import 'core/services/notificationServices.dart';
import 'core/services/services.dart';
import 'provider/userprovider.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/translation.dart';
import 'routes.dart';
import 'view/screen/language.dart';
import 'package:timezone/data/latest.dart' as tz;
// import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await initialServices();
  runApp(const MyApp());
}

/* runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (contex)=>UserProvider())
  ], child:const MyApp()));*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        title: 'Al Quran Community',
        locale: controller.language,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            toolbarHeight: 80,
            //height: 80.0,
          ),
          //fontFamily: "CaiPlayfairDisplayro",
          textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: AppColor.primaryColor),
            headlineMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.black),
            headlineSmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColor.black),
            bodyLarge: TextStyle(
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(AppColor.primaryColor),
          ),
        ),
        home: controller.myServices.sharedPreferences.getBool("langSelected") ==
                true
            ? Login()
            : Language(),

        // myServices.sharedPreferences.

        // Language(),
        routes: routes);
  }
}
