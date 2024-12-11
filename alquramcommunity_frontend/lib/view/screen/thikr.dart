import 'package:alquramcommunity_frontend/controller/thikrCatgController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/homescreen_controller.dart';
import '../../core/constant/constants.dart';
import '../widget/thikr/thikrhomeCatg.dart';

class Thikr extends StatelessWidget {
  const Thikr({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
    ThikrCatgControllerImp thikrController = Get.put(ThikrCatgControllerImp());
    thikrController.setisPlaying();
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;
    return ListView(children: [
      const SizedBox(height: 10),
      Container(
          padding: 
               EdgeInsets.only(top: 10),
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
