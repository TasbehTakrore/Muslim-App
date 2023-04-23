import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/view/screen/auth/login.dart';
import 'package:alquramcommunity_frontend/view/screen/auth/signup.dart';
import 'package:alquramcommunity_frontend/view/screen/homescreen.dart';
import 'package:alquramcommunity_frontend/view/screen/recitationscreen.dart';
import 'package:alquramcommunity_frontend/view/screen/surahsdialog.dart';
import 'package:alquramcommunity_frontend/view/screen/thikr.dart';
import 'package:flutter/material.dart';
import 'view/screen/auth/forgetpassword.dart';
import 'view/screen/pray.dart';
import 'view/screen/qibla.dart';
import 'view/screen/quranscreen.dart';
import 'view/screen/thikrdetails.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login(),
  AppRoute.home: (context) => const HomeScreen(),
  AppRoute.surahs: (context) => const SurahsDialog(),
  AppRoute.quran: (context) => const QuranScreen(),
  AppRoute.recitation: (context) => const RecitationScreen(),
  AppRoute.thikr: (context) => Thikr(),
  AppRoute.thikrdetails: (context) => const ThikrDetails(),
  AppRoute.signup: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.pray: (context) =>  PrayScreen(),
  AppRoute.qibla: (context) =>  QiblaScreen(),


};
