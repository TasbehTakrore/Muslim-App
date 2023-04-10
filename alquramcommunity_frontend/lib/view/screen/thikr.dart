import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/view/widget/logowidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/homescreen_controller.dart';
import '../../controller/thikrscreen_controller.dart';
import '../../core/constant/color.dart';
import '../widget/auth/logoauth.dart';
import '../widget/home/customappbar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/home/custombottomappbarhome.dart';
import '../widget/thikr/thikrhomeCatg.dart';

class Thikr extends StatelessWidget {
  const Thikr({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());

    return
        //Scaffold(
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: AppColor.primaryColor,
        //     onPressed: () {
        //       homeScreenControllerImp.changePage(4);
        //       Get.offAllNamed(AppRoute.home);
        //     },
        //     child: const Icon(Icons.home)),
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.centerDocked,
        //bottomNavigationBar: const CustomBottonAppBarHome(),
        //body:
        ListView(children: [
      const SizedBox(height: 10),
      //LogoAuth(),
      CustomAppBar(onPressedIcon: () {}),
      const SizedBox(height: 10),
      Container(
          //width: double.infinity,
          height: 800,
          padding: const EdgeInsets.only(top: 10),
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: const [
              Text("{أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "MADDINA")),
              SizedBox(height: 10),
              ThikrHomeCard2(),
            ],
          ))
    ])
        //)
        ;
  }
}
