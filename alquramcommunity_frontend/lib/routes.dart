import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'view/screen/auth/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login(),
  AppRoute.home: (context) => const Home()
};
