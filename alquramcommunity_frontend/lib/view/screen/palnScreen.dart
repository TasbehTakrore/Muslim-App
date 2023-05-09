import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/plan_controller.dart';
import '../../controller/prayscreen_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../widget/Plan/partialpancard.dart';
import '../widget/Plan/planmaincard.dart';
import '../widget/Plan/prayPlanCard.dart';
import '../widget/Plan/prayplanDialog.dart';
import '../widget/Plan/qurahPlanCard.dart';
import '../widget/Plan/recitationPlan.dart';
import '../widget/Plan/tadabborPlanCard.dart';
import '../widget/Plan/thikrPlanCard.dart';
import '../widget/home/customcardhome.dart';
import '../widget/prayingtimes/completedPray_dialog.dart';
import '../widget/prayingtimes/prayingtopCard.dart';
import '../widget/prayingtimes/prayslist.dart';

class PalnScreen extends StatelessWidget {
  PalnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlanController planController=  Get.put(PlanController());
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
                PrayPalnCard(),
                ThikrPalnCard(),
                QuranPlanCard(),
                TadabborPlanCard(),
                RecitationPlanCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
