import 'package:alquramcommunity_frontend/view/widget/prayingtimes/completedPray_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';

import '../../../controller/prayscreen_controller.dart';

class PrayCardHome extends StatelessWidget {
  final String date;
  final String hijridate;
  void Function()? onTap;
  final double fontSize1;
  final double fontSize2;
  final double heigh;
  final String nextPray;
  final String city_name;
  final String remainingTime;

  PrayCardHome({
    Key? key,
    required this.date,
    required this.hijridate,
    this.onTap,
    required this.fontSize1,
    required this.fontSize2,
    required this.heigh,
    required this.nextPray,
    required this.city_name,
    required this.remainingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PrayScreenControllerImp prayController =
        Get.put(PrayScreenControllerImp());
    return InkWell(
      onTap: onTap,
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
              height: heigh,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    date,
                    style: TextStyle(color: Colors.white, fontSize: fontSize2),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 0),
                  Text(hijridate,
                      style:
                          TextStyle(color: Colors.yellow, fontSize: fontSize1)),
                  const SizedBox(height: 0),
                  Text(nextPray,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 45)),
                  const SizedBox(height: 0),
                  Text("بعد +  ${remainingTime}",
                      style:
                          const TextStyle(color: Colors.yellow, fontSize: 15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 3),
                      GestureDetector(
                        child: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                        onTap: () {},
                      ),
                      Expanded(
                        child: Text(city_name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12)),
                      ),
                      GestureDetector(
                        onTap: () {
                          prayController.CompletedPray();

                          Get.dialog(PrayerProgressDialog());
                        },
                        child: Card(child: Icon(Icons.timelapse)),
                      ),
                    ],
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
