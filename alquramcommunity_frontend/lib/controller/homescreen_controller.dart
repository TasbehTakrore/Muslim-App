import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../view/screen/home.dart';
import '../view/screen/lists.dart';
import '../view/screen/palnScreen.dart';
import '../view/screen/pray.dart';
import '../view/screen/profile.dart';
import '../view/screen/qibla.dart';
import '../view/screen/thikr.dart';
import '../view/screen/tasbeh.dart';
import '../view/widget/notifications/notification.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  // @override
  // void onInit() {
  //   super.onInit();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // }

  void reSystemChrome() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

// @override
// void onInit() {
//   super.onInit();
//   ever<String>(Get.routing.current, (String currentRoute) {
//     if (currentRoute == '/homeScreen') {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//     }
//   });
// }

  int currentPage = 4;
  Rx<Widget> content = Home().obs;

  List<Widget> listPage = [
    
   Center(
    child: ProfileScreen()),

    Container(
      child: PalnScreen(),
    ),
    Container(
      child: Center(child: ListsScreen()),
    ),
    Container(
      child: Center(child: Text("")),
    ),
    const Home(),
    PrayScreen(),
    const Thikr(),
    const QiblaScreen(),
    MyApp(),

  ];

  List<String> titlebuttonAppBar = ["Profile", "Plan", "Lists", "Notif"];
  List<IconData> iconsbuttonAppBar = [
    Icons.person,
    Icons.playlist_add_check_rounded,
    Icons.list_alt,
    Icons.notifications
  ];

  @override
  changePage(int index) {
    currentPage = index;
    content = listPage[index].obs;
    update();
    print("change page");
  }
}
