import 'package:alquramcommunity_frontend/view/widget/prayingtimes/completedPray_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';

import '../../../controller/prayscreen_controller.dart';

class PlanMainCard extends StatelessWidget {
  // final String date;
  // final String hijridate;
  // void Function()? onTap;
  // final double fontSize1;
  // final double fontSize2;
  // final double heigh;
  // final String remainingTime;

  PlanMainCard({
    Key? key,
    // required this.date,
    // required this.hijridate,
    // this.onTap,
    // required this.fontSize1,
    // required this.fontSize2,
    // required this.heigh,
    // required this.remainingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PrayScreenControllerImp prayController =
        Get.put(PrayScreenControllerImp());
    return InkWell(
      // onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Stack(children: [
          Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(AppImageAsset.mosque),
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff266f52), Color(0xff266f52)],
                  )),
              alignment: Alignment.center,
              width: double.infinity,
              height: 150,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  // Text(
                  //   date,
                  //   style: TextStyle(color: Colors.white, fontSize: fontSize2),
                  //   textAlign: TextAlign.right,
                  // ),
                  // const SizedBox(height: 10),
                  // Text(hijridate,
                  //     style:
                  //         TextStyle(color: Colors.yellow, fontSize: fontSize1)),
                  // const SizedBox(height: 10),
                  // const SizedBox(height: 3),
                  Text("Time left to finish the plan",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                  Text("2:45:30",
                      style:
                          const TextStyle(color: Colors.yellow, fontSize: 50)),
                ],
              )),
        ]),
      ),
    );
  }
}
