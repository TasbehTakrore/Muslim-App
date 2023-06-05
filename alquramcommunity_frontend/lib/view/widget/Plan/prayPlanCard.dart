import 'dart:math';

import 'package:confetti/confetti.dart';
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
                    ConfettiWidget(
                      confettiController: controller.confettiController,
                      shouldLoop: true,
                      blastDirection: -pi / 2,
                      minBlastForce: 5,
                      maxBlastForce: 6,
                      emissionFrequency: 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("خطّتي اليوميّة", style: TextStyle(fontSize: 25)),
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
                    const Divider(),
                    PartialPlanCard(
                      checkValue: controller.quranPlanCheckValue,
                      visibleValue: controller.quranPlanVisible,
                      onChange: (val) {
                        controller.changequranPlanCheck(val!);
                      },
                      partialCardData:
                          'قراءة  ' + controller.getTypeQuranPlan(),
                    ),
                    const Divider(),
                    PartialPlanCard(
                      checkValue: controller.TadabborPlanCheckValue,
                      visibleValue: controller.TadabborPlanVisible,
                      onChange: (val) {
                        controller.changeTadabborPlanCheck(val!);
                      },
                      partialCardData:
                          'تدبّر  ' + controller.getTypeTadabborPlan(),
                    ),
                    const Divider(),
                    PartialPlanCard(
                      checkValue: controller.RecitationPlanCheckValue,
                      visibleValue: controller.RecitationPlanVisible,
                      onChange: (val) {
                        controller.changeRecitationPlanCheck(val!);
                      },
                      partialCardData:
                          'تسميع  ' + controller.getTypeRecitationPlan(),
                    ),
                  ],
                ),
              ),
            ));
  }
}
