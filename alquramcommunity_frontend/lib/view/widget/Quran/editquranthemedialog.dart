import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

class EditQuranThemeDialog extends StatelessWidget {
  EditQuranThemeDialog({super.key});
  @override
  Widget build(BuildContext context) {
    QuranPageController controller = Get.put(QuranPageController());

    return AlertDialog(
      backgroundColor: Color.fromARGB(200, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Slider(
                activeColor: Color.fromARGB(255, 0, 0, 0),
                inactiveColor: const Color.fromARGB(255, 250, 240, 227),
                value: QuranConstant.fontsize.value,
                min: 15,
                max: 40,
                divisions: 603,
                onChanged: (v) {
                  controller.changeFontSize(v);
                },
              )),
          Obx(() => Text('حجم الخطّ  ${QuranConstant.fontsize.value}',
              style: const TextStyle(fontSize: 13))),
          Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            // Slider(
            //   value: 15,
            //   onChanged: (i) {},
            // ),

            Obx(() => InkWell(
                onTap: () {
                  controller.changeBackground(0);
                  controller.changeFontColorToBlack();
                  controller.white.value = true;
                  controller.black.value = false;
                  controller.lightYallow.value = false;
                  controller.darkYallow.value = false;
                },
                child: CircleAvatar(
                    backgroundColor: QuranConstant.backgroundColors[0],
                    child: controller.white.value
                        ? Icon(Icons.check)
                        : SizedBox()))),
            Obx(() => InkWell(
                onTap: () {
                  controller.changeBackground(1);
                  controller.changeFontColorToBlack();
                  controller.lightYallow.value = true;
                  controller.black.value = false;
                  controller.white.value = false;
                  controller.darkYallow.value = false;
                },
                child: CircleAvatar(
                    backgroundColor: QuranConstant.backgroundColors[1],
                    child: controller.lightYallow.value
                        ? Icon(Icons.check)
                        : SizedBox()))),
            Obx(() => InkWell(
                onTap: () {
                  controller.changeBackground(2);
                  controller.changeFontColorToBlack();
                  controller.black.value = false;
                  controller.lightYallow.value = false;
                  controller.white.value = false;
                  controller.darkYallow.value = true;
                },
                child: CircleAvatar(
                    backgroundColor: QuranConstant.backgroundColors[2],
                    child: controller.darkYallow.value
                        ? Icon(Icons.check)
                        : SizedBox()))),
            Obx(() => InkWell(
                onTap: () {
                  controller.changeBackground(3);
                  controller.changeFontColorToWhite();
                  controller.black.value = true;
                  controller.lightYallow.value = false;
                  controller.white.value = false;
                  controller.darkYallow.value = false;
                },
                child: CircleAvatar(
                    backgroundColor: QuranConstant.backgroundColors[3],
                    child: controller.black.value
                        ? Icon(Icons.check)
                        : SizedBox()))),
          ]),
          const Divider(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "تفعيل تحديد الأخطاء",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Obx(() => Container(
                    // color: AppColor.grey,r
                    child: Switch(
                        dragStartBehavior: DragStartBehavior.start,
                        value: QuranConstant.showMistake.value,
                        activeColor: AppColor.primaryColor,
                        onChanged: (value) {
                          QuranConstant.showMistake.value = value;
                          controller.updatee();
                          print("value: $value");
                          // profilesController.childMode.value = value;
                        }),
                  )),
            ],
          ),
          const Divider(),
          CustomButton(
            color: AppColor.secondaryColor,
            onPressed: () => Get.back(),
            textbutton: 'ضبط',
          ),
          const SizedBox(height: 16),
          InkWell(
              onTap: () {
                controller.goToDefult();
                Get.back();
              },
              child: const Text(
                "العودة إلى الوضع الافتراضي",
                style: TextStyle(fontSize: 13),
              ))
        ],
      ),
    );
  }
}
