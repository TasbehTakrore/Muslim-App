import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/plan_controller.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';
import 'partialpancard.dart';
import 'prayplanDialog.dart';
import 'quranplandialog.dart';
import 'thikrPalnDialog.dart';

class QuranPlanCard extends StatelessWidget {
  const QuranPlanCard({super.key});

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
                child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                                      return QuranPlanDialog();
                                    });
                              }),
                          const Text("خطّة قراءة القرآن",
                              style: TextStyle(fontSize: 25)),
                        ],
                      ),
                      Transform.scale(
                        // لتكبير حجم الشيكبوكس
                        scale: 1.3,
                        child: Checkbox(
                          activeColor: AppColor.primaryColor,
                          hoverColor: Colors.black,
                          value: controller.mainQuranCheckValue.value,
                          onChanged: (value) {
                            controller.changeMainQuranCheck(value!);
                          },
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  PartialPlanCard(
                    checkValue: controller.quranPlanCheckValue,
                    visibleValue: controller.quranPlanVisible,
                    onChange: (val) {
                      controller.changequranPlanCheck(val!);
                    },
                    partialCardData: 'قراءة  ' + controller.getTypeQuranPlan(),
                  ),
                ]),
              ),
            ));
  }
}
