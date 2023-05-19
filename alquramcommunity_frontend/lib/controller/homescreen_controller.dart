import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../core/services/community_services.dart';
import '../core/services/services.dart';
import '../view/screen/home.dart';
import '../view/screen/lists.dart';
import '../view/screen/palnScreen.dart';
import '../view/screen/pray.dart';
import '../view/screen/profile.dart';
import '../view/screen/qibla.dart';
import '../view/screen/thikr.dart';
import '../view/screen/tasbeh.dart';
import '../view/widget/notifications/notification.dart';
import 'commnity_controller.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  MyServices myServices = Get.put(MyServices());
  CommunitityController communitityController =
      Get.put(CommunitityController());
  List<String> myCommunities = [];
  CommunityServices communityServices = Get.put(CommunityServices());

  // @override
  // void onInit() {
  //   super.onInit();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // }

  String userEmail = "";

  @override
  void onInit() async {
    super.onInit();
    userEmail = myServices.sharedPreferences.getString("user_email")!;

    getMyCommu();

    print("myCommunities inside homeScreen $myCommunities");
    communitityController.getAllCommunities();
  }

  String getEmail() {
    userEmail = myServices.sharedPreferences.getString("user_email")!;
    return userEmail;
  }

  Future<List<String>> getMyCommu() async {
    myCommunities =
        await communityServices.getMyCommunities(userEmail: getEmail());
    return myCommunities;
  }

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
    Center(child: ProfileScreen()),
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
    TasbeehPage(),
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
