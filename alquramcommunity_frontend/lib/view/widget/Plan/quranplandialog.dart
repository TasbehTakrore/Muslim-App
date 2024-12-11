import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import '../../../controller/auth/plan_controller.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

class QuranPlanDialog extends StatelessWidget {
  QuranPlanDialog({super.key});
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
                    Text("اضبط إعدادات خطّة القراءة"),
                    const Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 40,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: controller.juzBorder,
                              color: AppColor.lightYellow),
                          child: InkWell(
                            onTap: () {
                              controller.juzSettings();
                            },
                            child: Text("جزء"),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 40,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: controller.hezbBorder,
                              color: AppColor.lightYellow),
                          child: InkWell(
                            onTap: () {
                              controller.hezbSettings();
                            },
                            child: Text("حزب"),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 40,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: controller.safhaBorder,
                              color: AppColor.lightYellow),
                          child: InkWell(
                            onTap: () {
                              controller.safhaSettings();
                            },
                            child: Text("صفحة"),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Text(
                      "حرّك لاختيار الكميّة، بعد ضبط النوع في الأعلى",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NumberPicker(
                          itemCount: 3,
                          value: controller.quranPlanCount,
                          minValue: controller.minQuran!,
                          maxValue: controller.maxQuran!,
                          step: 1,
                          itemHeight: 50,
                          itemWidth: 50,
                          axis: Axis.horizontal,
                          onChanged: (value) {
                            controller.setQuranPlanCount(value);
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
                          controller.QuranVisibleFunc(0);
                          Get.back();
                        },
                        child: const Text(
                          "اضغط هنا لإلغاء تفعيل خطة القراءة",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    const Divider(),
                    CustomButton(
                      color: AppColor.secondaryColor,
                      onPressed: () {
                        controller.QuranVisibleFunc(1);

                        Get.back();
                      },
                      textbutton: 'إضافة',
                    ),
                  ],
                ),
              ),
            ));
  }
}
