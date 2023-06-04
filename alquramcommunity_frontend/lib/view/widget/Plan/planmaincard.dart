import 'dart:math';

import 'package:alquramcommunity_frontend/controller/auth/plan_controller.dart';
import 'package:alquramcommunity_frontend/view/widget/prayingtimes/completedPray_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/constants.dart';

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
    // bool isPlayed = false;
    // confettiController.play();
    final PlanController planController = Get.put(PlanController());
    return InkWell(
      onTap: () {},
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
            height: 170,
            child: Obx(() => Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text("الوقت المتبقّي لإنهاء الخطّة",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                    Text(planController.formattedRemainingTime.value,
                        style: const TextStyle(
                            color: Colors.yellow, fontSize: 50)),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 8, 0, 8),
                          child: LinearPercentIndicator(
                            percent: planController.progress.value,
                            width: MediaQuery.of(context).size.width / 1.5,
                            lineHeight: 20,
                            animation: true,
                            progressColor: Color.fromARGB(193, 252, 204, 92),
                            backgroundColor: Color(0xFFE0E3E7),
                            barRadius: Radius.circular(10),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
               
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
