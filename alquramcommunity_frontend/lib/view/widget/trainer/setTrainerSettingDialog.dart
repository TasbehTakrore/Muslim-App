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
                    trainerScreenController.firstWordCheck.value = value!;
                  },
                )),
            const Divider(),
            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء آخر كلمة في الآية'),
                  value: trainerScreenController.lastWordCheck.value,
                  onChanged: (value) {
                    trainerScreenController.lastWordCheck.value = value!;
                  },
                )),
            const Divider(),
            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء النّصف الأوّل من الآية'),
                  value: trainerScreenController.firstPartCheck.value,
                  onChanged: (value) {
                    trainerScreenController.firstPartCheck.value = value!;
                  },
                )),
            const Divider(),
            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء النّصف الأخير  من الآية'),
                  value: trainerScreenController.lastPartCheck.value,
                  onChanged: (value) {
                    trainerScreenController.lastPartCheck.value = value!;
                  },
                )),
            const Divider(),

            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء الآية السابقة'),
                  value: trainerScreenController.previousCheck.value,
                  onChanged: (value) {
                    trainerScreenController.previousCheck.value = value!;
                  },
                )),
            const Divider(),

            Obx(() => CheckboxListTile(
                  title: const Text('إخفاء الآية التالية'),
                  value: trainerScreenController.nextCheck.value,
                  onChanged: (value) {
                    trainerScreenController.nextCheck.value = value!;
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
