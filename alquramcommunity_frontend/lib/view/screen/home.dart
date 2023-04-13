import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widget/home/categoriesHome.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customappbar.dart';
import '../widget/home/listcommunities.dart';
import '../widget/home/statisticscard.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.grey,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            // CustomAppBar(onPressedIcon: () {}),
            CustomCardHome(
              heigh: 150,
              title: "2".tr,
              body: "{واستعينوا بالصّبر والصّلاة}",
              fontSize1: 15,
              fontSize2: 30,
            ),
            const ListCategoriesHome(),
            const SizedBox(height: 10),
            const Text("مُجتمعات القُرآن"),
            const ListCommunities(),
            const StatisticsCard(),
          ],
        ));
  }
}
