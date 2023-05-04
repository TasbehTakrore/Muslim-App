import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/plan_controller.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

class PrayPalnDialog extends StatelessWidget {
  PrayPalnDialog({super.key});
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
                    Text("أضف الصّلوات إلى خطّتك"),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.addFivePray.value,
                            onChanged: (value) {
                              controller.addFivePrayFunc(value!);
                            }),
                        Text(" الصلوات الخمس")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.addDuha.value,
                            onChanged: (value) {
                              controller.addDuhaFunc(value!);
                            }),
                        Text(" صلاة الضحى")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: controller.addQeiam.value,
                            onChanged: (value) {
                              controller.addQeiamFunc(value!);
                            }),
                        Text(" قيام الليل")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            //visualDensity: false,
                            activeColor: AppColor.primaryColor,
                            value: false,
                            onChanged: (value) {
                              //no change.... نخليها لرمضان
                              //controller.addFivePrayFunc(value!);
                            }),
                        Text("صلاة التراويح")
                      ],
                    ),
                    const Divider(),
                    CustomButton(
                      color: AppColor.secondaryColor,
                      onPressed: () => Get.back(),
                      textbutton: 'Done',
                    ),
                  ],
                ),
              ),
            ));
  }
}
