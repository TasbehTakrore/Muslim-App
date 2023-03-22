import 'package:alquramcommunity_frontend/controller/homescreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  controller.changePage(4);
                },
                child: const Icon(Icons.home)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottonAppBarHome(),
            body: controller.listPage.elementAt(controller.currentPage)));
  }
}
