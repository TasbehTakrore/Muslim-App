// <<<<<<< ayaaah
// =======
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:easy_actions/easy_actions.dart';
// >>>>>>> main
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/plan_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/constants.dart';
import '../../core/constant/routes.dart';
import '../widget/Plan/createPlanContent.dart';
import '../widget/Plan/planmaincard.dart';
import '../widget/Plan/prayPlanCard.dart';

class PalnScreen extends StatelessWidget {
  PalnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlanController());
    PlanController planController = Get.put(PlanController());
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed(AppRoute.home);
        return false;
      },
      child: GetBuilder<PlanController>(
        builder: (controller) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: isLaptopScreen == true
              ? EdgeInsets.only(right: screenWidth / 11, left: screenWidth / 6)
              : null,
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.bottom,
          child: SingleChildScrollView(
            // wrap Column widget in SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlanMainCard(),
                TextButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                                content: CreatePlanContent());
                          });
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: AppColor.secondaryColor,
                    ),
                    label: const Text(
                      "ضبط إعدادات الخُطّة",
                      style: TextStyle(color: AppColor.primaryColor),
                    )),
                PrayPalnCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
