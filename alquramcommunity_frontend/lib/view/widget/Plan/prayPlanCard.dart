import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/plan_controller.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';
import 'partialpancard.dart';
import 'prayplanDialog.dart';

class PrayPalnCard extends StatelessWidget {
  const PrayPalnCard({super.key});

  @override
  Widget build(BuildContext context) {

Get.put(PlanController());
    PrayScreenControllerImp prayScreenController =
        Get.put(PrayScreenControllerImp());


    return GetBuilder<PlanController>(
        builder: (controller) =>  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColor.lightYellow),
      //height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 13.0),
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
                    const Text("خطّة الصلاة", style: TextStyle(fontSize: 25)),
                  ],
                ),
                Transform.scale(
                  // لتكبير حجم الشيكبوكس
                  scale: 1.3,
                  child: Checkbox(
                    activeColor: AppColor.primaryColor,
                    hoverColor: Colors.black,
                    value: controller.mainPrayCheckValue.value,
                    onChanged: (value) {
                      controller.changeMainPrayCheck(value!);
                    },
                  ),
                )
              ],
            ),
            const Divider(),
            PartialPlanCard(
                checkValue: controller.fivePrayCheckValue,
                visibleValue: controller.fivePrayVisibleValue,
                onChange: (val) {
                  controller.changeFivePrayCheck(val!);
                },
                partialCardData: "الصلوات الخمس اليومية" +
                    "  ${prayScreenController.prayCounter.value}/5"),
            PartialPlanCard(
              checkValue: controller.duhaCheckValue,
              visibleValue: controller.duhaVisibleValue,
              partialCardData: "صلاة الضحى",
              onChange: (val) {
                controller.changeDuhaCheck(val!);
              },
            ),
            PartialPlanCard(
              checkValue: controller.qeiamCheckValue,
              visibleValue: controller.qeiamVisibleValue,
              partialCardData: "صلاة القيام",
              onChange: (val) {
                controller.changeQeiamCheck(val!);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
