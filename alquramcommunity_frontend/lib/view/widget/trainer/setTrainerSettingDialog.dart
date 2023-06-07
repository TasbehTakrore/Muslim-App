import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/trainerScreen_controller.dart';
import '../../../core/constant/color.dart';

class SetTrainerSettingDialog extends StatelessWidget {
  const SetTrainerSettingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TrainerScreenController trainerScreenController =
        Get.put(TrainerScreenController());

    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("حدّد طبيعة الأسئلة"),
            const Divider(),
            const SizedBox(
                width: 8), // add some spacing between text and checkbox
            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء أوّل كلمة في الآية'),
                  value: trainerScreenController.firstWordCheck.value,
                  onChanged: (value) {
                    if (trainerScreenController.countType == 1) {
                      print(
                          " 11trainerScreenController.firstWordCheck.value: ${trainerScreenController.countType}");
                      if (value == true) {
                        trainerScreenController.firstWordCheck.value = value!;
                        trainerScreenController.countType++;
                      }
                    } else {
                      print(value);
                      trainerScreenController.firstWordCheck.value = value!;
                      if (value == false)
                        trainerScreenController.countType--;
                      else
                        trainerScreenController.countType++;

                      print(
                          " trainerScreenController.firstWordCheck.value: ${trainerScreenController.countType}");
                    }
                    ;
                  },
                )),
            const Divider(),
            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء آخر كلمة في الآية'),
                  value: trainerScreenController.lastWordCheck.value,
                  onChanged: (value) {
                    if (trainerScreenController.countType == 1) {
                      if (value == true) {
                        trainerScreenController.lastWordCheck.value = value!;
                        trainerScreenController.countType++;
                      }
                    } else {
                      trainerScreenController.lastWordCheck.value = value!;
                      if (value == false)
                        trainerScreenController.countType--;
                      else
                        trainerScreenController.countType++;
                    }
                    ;
                  },
                )),
            const Divider(),
            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء النّصف الأوّل من الآية'),
                  value: trainerScreenController.firstPartCheck.value,
                  onChanged: (value) {
                    if (trainerScreenController.countType == 1) {
                      if (value == true) {
                        trainerScreenController.firstPartCheck.value = value!;
                        trainerScreenController.countType++;
                      }
                    } else {
                      trainerScreenController.firstPartCheck.value = value!;
                      if (value == false)
                        trainerScreenController.countType--;
                      else
                        trainerScreenController.countType++;
                    }
                    ;
                  },
                )),
            const Divider(),
            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء النّصف الأخير  من الآية'),
                  value: trainerScreenController.lastPartCheck.value,
                  onChanged: (value) {
                    if (trainerScreenController.countType == 1) {
                      if (value == true) {
                        trainerScreenController.lastPartCheck.value = value!;
                        trainerScreenController.countType++;
                      }
                    } else {
                      trainerScreenController.lastPartCheck.value = value!;
                      if (value == false)
                        trainerScreenController.countType--;
                      else
                        trainerScreenController.countType++;
                    }
                    ;
                  },
                )),
            const Divider(),

            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء الآية السابقة'),
                  value: trainerScreenController.previousCheck.value,
                  onChanged: (value) {
                    if (trainerScreenController.countType == 1) {
                      if (value == true) {
                        trainerScreenController.previousCheck.value = value!;
                        trainerScreenController.countType++;
                      }
                    } else {
                      trainerScreenController.previousCheck.value = value!;
                      if (value == false)
                        trainerScreenController.countType--;
                      else
                        trainerScreenController.countType++;
                    }
                    ;
                  },
                )),
            const Divider(),

            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء الآية التالية'),
                  value: trainerScreenController.nextCheck.value,
                  onChanged: (value) {
                    if (trainerScreenController.countType == 1) {
                      if (value == true) {
                        trainerScreenController.nextCheck.value = value!;
                        trainerScreenController.countType++;
                      }
                    } else {
                      trainerScreenController.nextCheck.value = value!;
                      if (value == false)
                        trainerScreenController.countType--;
                      else
                        trainerScreenController.countType++;
                    }
                    ;
                  },
                )),
            const Divider(),
            Container(
              width: 300,
              child: EasyElevatedButton(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  label: "تفعيل",
                  isRounded: true,
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  //height: ,
                  labelColor: AppColor.grey,
                  color: AppColor.primaryColor,
                  onPressed: () {
                    trainerScreenController.testType();
                    Get.back();
                  }),
            )
          ],
        ));
  }
}
