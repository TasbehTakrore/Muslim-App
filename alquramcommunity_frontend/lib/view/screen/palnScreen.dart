import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/plan_controller.dart';
import '../../controller/prayscreen_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../widget/Plan/createPlanContent.dart';
import '../widget/Plan/partialpancard.dart';
import '../widget/Plan/planmaincard.dart';
import '../widget/Plan/prayPlanCard.dart';
import '../widget/Plan/prayPlanCardSetPlan.dart';
import '../widget/Plan/prayplanDialog.dart';
import '../widget/home/customcardhome.dart';
import '../widget/prayingtimes/completedPray_dialog.dart';
import '../widget/prayingtimes/prayingtopCard.dart';
import '../widget/prayingtimes/prayslist.dart';

class PalnScreen extends StatelessWidget {
  PalnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlanController());

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
