// ignore_for_file: prefer_const_constructors

import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/firebase_options.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
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
import 'package:firebase_messaging/firebase_messaging.dart';

var fm = FirebaseMessaging.instance;
bool islog = false;
Future background(RemoteMessage message) async {
  print(
      "======================back ground ===================================");
  print("${message.notification!.body}");
  print(
      "======================back ground end===================================");
}

initialMessage() async {
  var message = await FirebaseMessaging.instance.getInitialMessage();
  if (message != null) {
    print("www");
    Get.toNamed(AppRoute.forgetPassword);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initialMessage();
//FirebaseMessaging.onBackgroundMessage(background);
  fm.getToken().then((value) {
    print("======================Token===================================");
    print(value);
    print(
        "====================== end Token===================================");
  });
  initialMessage();

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    Get.toNamed(AppRoute.qibla);
  });
  FirebaseMessaging.onMessage.listen((event) {
    print(
        "======================data notificator ===================================");

    print("${event.notification!.body}");
    print(
        "======================data notificator end ===================================");
  });
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
    print(
        "++${controller.myServices.sharedPreferences.getString("user_email")}");

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
        home: EasySplashScreen(
          logo: Image.asset('assets/images/fakeLogo.png'),
          backgroundImage: AssetImage('assets/images/splash.png'),
          loaderColor: Color.fromARGB(255, 51, 51, 51),
          // title: Text(
          //   "Title",
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          backgroundColor: Colors.grey.shade400,
          showLoader: true,
          loadingText: Text(
            "يجري تحميل الصفحة...",
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Color.fromARGB(255, 68, 68, 68)),
          ),
          navigator:
              controller.myServices.sharedPreferences.getBool("langSelected") ==
                      true
                  ? controller.myServices.sharedPreferences
                                  .getString("user_email") ==
                              null ||
                          controller.myServices.sharedPreferences
                                  .getString("user_email") ==
                              " "
                      ? Login()
                      : HomeScreen()
                  : Language(),
          durationInSeconds: 5,
        ),

        // myServices.sharedPreferences.

        // Language(),
        routes: routes);
  }
}
