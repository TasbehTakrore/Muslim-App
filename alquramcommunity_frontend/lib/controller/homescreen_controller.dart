import 'package:alquramcommunity_frontend/view/screen/homescreen.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../view/screen/home.dart';
import '../view/screen/thikr.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 4;

  List<Widget> listPage = [
    Container(
      child: Center(child: Text("Profile")),
    ),
    Container(
      child: Center(child: Text("\uFD3E" + "1" + "\uFD3F")),
    ),
    Container(
      child: Center(child: Text("Lists")),
    ),
    Container(
      child: Center(child: Text("Notifications")),
    ),
    const Home(),
    const Thikr(),
  ];

  List<String> titlebuttonAppBar = ["Profile", "Plan", "Lists", "Notif"];
  List<IconData> iconsbuttonAppBar = [
    Icons.person,
    Icons.polyline,
    Icons.list_alt,
    Icons.notifications
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
