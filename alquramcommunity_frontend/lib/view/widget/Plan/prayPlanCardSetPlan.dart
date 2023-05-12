import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/plan_controller.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';
import 'partialpancard.dart';
import 'prayplanDialog.dart';

class PrayPalnCardSetPlan extends StatelessWidget {
  const PrayPalnCardSetPlan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlanController());
    PrayScreenControllerImp prayScreenController =
        Get.put(PrayScreenControllerImp());

    return GetBuilder<PlanController>(
        builder: (controller) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.lightYellow),
              //height: 100,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext b) {
                                        return PrayPalnDialog();
                                      }); // 1 = flage mean show pray data
                                }),
                            const Text("خطّة الصلاة",
                                style: TextStyle(fontSize: 25)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
