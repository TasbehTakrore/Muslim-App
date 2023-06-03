import 'package:alquramcommunity_frontend/controller/auth/plan_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../controller/randomVerse_controller.dart';
import '../../core/constant/imageasset.dart';
import '../widget/home/categoriesHome.dart';
import '../widget/home/customCardHomeForQuranDilog.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/listcommunities.dart';
import '../widget/home/statisticscard.dart';

PlanController planController = Get.put(PlanController());
Future<void> initializeData() async {
  await planController.showPlantoUser();
  await planController.weekCalc();
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeData();
    RandomVerseController randomVerseController =
        Get.put(RandomVerseController());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;
    return Container(
        color: AppColor.grey,
        padding: isLaptopScreen == true
            ? EdgeInsets.only(left: 150, right: 30)
            : const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            // CustomAppBar(onPressedIcon: () {}),
            CustomCardHomeForQuranDilog(
              heigh: isLaptopScreen == true ? 218 : 170,
              title: "2".tr,
              body: randomVerseController.todeyVerse,
              fontSize1: 22,
              fontSize2: 20,
            ),
            isLaptopScreen == true ? SizedBox(height: 10) : SizedBox(),
            const ListCategoriesHome(),
            // const SizedBox(height: 10),

            const Text(" المُجتمعات"),
            const ListCommunities(),
            const StatisticsCard(),
          ],
        ));
  }
}
