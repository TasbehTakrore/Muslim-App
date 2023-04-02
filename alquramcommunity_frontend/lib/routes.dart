import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/view/screen/auth/login.dart';
import 'package:alquramcommunity_frontend/view/screen/homescreen.dart';
import 'package:alquramcommunity_frontend/view/screen/surahs.dart';
import 'package:flutter/material.dart';
import 'view/screen/quranscreen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login(),
  AppRoute.home: (context) => const HomeScreen(),
  AppRoute.surahs: (context) => const Surahs(),
  AppRoute.quran: (context) => QuranScreen(),
};
