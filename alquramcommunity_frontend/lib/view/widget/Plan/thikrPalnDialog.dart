import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/plan_controller.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

class ThikrPlanDialog extends StatelessWidget {
  ThikrPlanDialog({super.key});
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
                    Text("أضف الأذكار إلى خطّتك"),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.addSapahThikr.value,
                            onChanged: (value) {
                              controller.addSapahThikeFunc(value!);
                            }),
                        Text(" أذكار الصّباح")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.addwakeUp.value,
                            onChanged: (value) {
                              controller.addwakeUpFunc(value!);
                            }),
                        Text(" أذكار الاستيقاظ")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.addmasaThikr.value,
                            onChanged: (value) {
                              controller.addmasaThikeFunc(value!);
                            }),
                        Text(" أذكار المساء")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.addsleep.value,
                            onChanged: (value) {
                              controller.addsleepFunc(value!);
                            }),
                        Text(" أذكار النوم")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.addadhan.value,
                            onChanged: (value) {
                              controller.addadhanFunc(value!);
                            }),
                        Text(" أذكار الأذان")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.addwodoo.value,
                            onChanged: (value) {
                              controller.addwodooFunc(value!);
                            }),
                        Text(" أذكار الوضوء")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.addsalahThikr.value,
                            onChanged: (value) {
                              controller.addsalahThikrFunc(value!);
                            }),
                        Text(" أذكار الصلاة")
                      ],
                    ),
                    const Divider(),
                    CustomButton(
                      color: AppColor.secondaryColor,
                      onPressed: () => Get.back(),
                      textbutton: 'إضافة',
                    ),
                  ],
                ),
              ),
            ));
  }
}
