import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import '../../../controller/auth/plan_controller.dart';

import '../custombuttomlang.dart';

class RecitationPlanDialog extends StatelessWidget {
  RecitationPlanDialog({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(PlanController());

    return GetBuilder<PlanController>(
        builder: (controller) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              content: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("اضبط إعدادات خطّة التسميع"),
                    const Divider(),
                    const Text(
                      "حرّك لاختيار عدد الصّفحات التي تريد تسميعا يوميًّا",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NumberPicker(
                          itemCount: 3,
                          value: controller.RecitationPlanCount,
                          minValue: 1,
                          maxValue: 604,
                          step: 1,
                          itemHeight: 50,
                          itemWidth: 50,
                          axis: Axis.horizontal,
                          onChanged: (value) {
                            controller.setQuranPlanCountRecitation(value);
                          },
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black26),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    InkWell(
                        onTap: () {
                          controller.RecitationVisibleFunc(0);
                          Get.back();
                        },
                        child: const Text(
                          "اضغط هنا لإلغاء تفعيل خطة التدبّر",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    const Divider(),
                    CustomButton(
                      color: AppColor.secondaryColor,
                      onPressed: () {
                        controller.RecitationVisibleFunc(1);

                        Get.back();
                      },
                      textbutton: 'Done',
                    ),
                  ],
                ),
              ),
            ));
  }
}
