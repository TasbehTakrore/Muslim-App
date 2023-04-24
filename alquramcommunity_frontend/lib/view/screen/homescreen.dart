import 'package:alquramcommunity_frontend/controller/homescreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../widget/home/customappbar.dart';
import '../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
    return WillPopScope(
        onWillPop: () async {
          homeScreenControllerImp.changePage(4);
          Get.back();

          return false;
        },
        child: GetBuilder<HomeScreenControllerImp>(
            builder: (controller) => Scaffold(
                floatingActionButton: FloatingActionButton(
                    backgroundColor: AppColor.primaryColor,
                    onPressed: () {
                      controller.changePage(4);
                    },
                    child: const Icon(Icons.home)),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                appBar: AppBar(
                    shadowColor: AppColor.grey,
                    automaticallyImplyLeading: false,
                    //primary: true,
                    elevation: 0.0,
                    backgroundColor: AppColor.grey,
                    title: CustomAppBar(onPressedIcon: () {})
                    //titleTextStyle: TextStyle(text),
                    ),
                bottomNavigationBar: const CustomBottonAppBarHome(),
                backgroundColor: AppColor.grey,
                body: controller.content.value
                //controller.listPage.elementAt(controller.currentPage)

                )));
  }
}
