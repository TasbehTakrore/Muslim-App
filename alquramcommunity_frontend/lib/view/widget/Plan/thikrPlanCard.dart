import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/plan_controller.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';
import 'partialpancard.dart';
import 'prayplanDialog.dart';
import 'thikrPalnDialog.dart';

class ThikrPalnCard extends StatelessWidget {
  const ThikrPalnCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlanController());

    return GetBuilder<PlanController>(
        builder: (controller) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.lightYellow),
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
                                        return ThikrPlanDialog();
                                      });
                                }),
                            const Text("خطّة الأذكار",
                                style: TextStyle(fontSize: 25)),
                          ],
                        ),
                        Transform.scale(
                          // لتكبير حجم الشيكبوكس
                          scale: 1.3,
                          child: Checkbox(
                            activeColor: AppColor.primaryColor,
                            hoverColor: Colors.black,
                            value: controller.mainThikrCheckValue.value,
                            onChanged: (value) {
                              controller.changeMainThikrCheck(value!);
                            },
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    PartialPlanCard(
                        checkValue: controller.sapahThikrCheckValue,
                        visibleValue: controller.sapahThikrVisibleValue,
                        onChange: (val) {
                          controller.changeSapahThikrCheck(val!);
                        },
                        partialCardData: "أذكار الصّباح"),
                    PartialPlanCard(
                        checkValue: controller.masaThikrCheckValue,
                        visibleValue: controller.masaThikrVisibleValue,
                        onChange: (val) {
                          controller.changemasaThikrCheck(val!);
                        },
                        partialCardData: "أذكار المساء"),
                    PartialPlanCard(
                        checkValue: controller.wakeUpCheckValue,
                        visibleValue: controller.wakeUpVisibleValue,
                        onChange: (val) {
                          controller.changewakeUpCheck(val!);
                        },
                        partialCardData: "أذكار الاستيقاظ"),

                    PartialPlanCard(
                        checkValue: controller.sleepCheckValue,
                        visibleValue: controller.sleepVisibleValue,
                        onChange: (val) {
                          controller.changesleepCheck(val!);
                        },
                        partialCardData: "أذكار النوم"),
                    PartialPlanCard(
                        checkValue: controller.adhanCheckValue,
                        visibleValue: controller.adhanVisibleValue,
                        onChange: (val) {
                          controller.changeadhanCheck(val!);
                        },
                        partialCardData: "أذكار الأذان"),

                    PartialPlanCard(
                        checkValue: controller.wodooCheckValue,
                        visibleValue: controller.wodooVisibleValue,
                        onChange: (val) {
                          controller.changewodooCheck(val!);
                        },
                        partialCardData: "أذكار الوضوء"),

                    PartialPlanCard(
                        checkValue: controller.salahThikrCheckValue,
                        visibleValue: controller.salahThikrVisibleValue,
                        onChange: (val) {
                          controller.changesalahThikrCheck(val!);
                        },
                        partialCardData: "أذكار الصلاة"),
                    // partialCardData: "أذكار الأذان"),                    PartialPlanCard(
                    // checkValue: controller.masaThikrCheckValue,
                    // visibleValue: controller.masaThikrVisibleValue,
                    // onChange: (val) {
                    //   controller.changemasaThikrCheck(val!);
                    // },
                    // partialCardData: "أذكار الوضوء"),                    PartialPlanCard(
                    // checkValue: controller.masaThikrCheckValue,
                    // visibleValue: controller.masaThikrVisibleValue,
                    // onChange: (val) {
                    //   controller.changemasaThikrCheck(val!);
                    // },
                    // partialCardData: "أذكار الصلاة"),
                  ],
                ),
              ),
            ));
  }
}
