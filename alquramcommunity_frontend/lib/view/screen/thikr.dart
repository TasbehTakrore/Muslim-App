import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/homescreen_controller.dart';
import '../widget/thikr/thikrhomeCatg.dart';

class Thikr extends StatelessWidget {
  const Thikr({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
    return
        ListView(  
          children: [
      const SizedBox(height: 10),
      Container(
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
