// ignore_for_file: prefer_const_constructors

import 'package:alquramcommunity_frontend/view/screen/auth/homescreen.dart';

import 'core/constant/color.dart';
import 'core/localization/changelocal.dart';
import 'core/services/services.dart';
import 'view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/translation.dart';
import 'routes.dart';
import 'view/screen/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

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
                    fontSize: 16))),
        home: const HomeScreen(),
        routes: routes);
  }
}
