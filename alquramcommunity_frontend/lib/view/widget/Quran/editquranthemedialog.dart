import 'package:alquramcommunity_frontend/core/constant/color.dart';
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

            InkWell(
                onTap: () {
                  controller.changeBackground(0);
                  controller.changeFontColorToBlack();
                },
                child: CircleAvatar(
                  backgroundColor: QuranConstant.backgroundColors[0],
                )),
            InkWell(
                onTap: () {
                  controller.changeBackground(1);
                  controller.changeFontColorToBlack();
                },
                child: CircleAvatar(
                  backgroundColor: QuranConstant.backgroundColors[1],
                )),
            InkWell(
                onTap: () {
                  controller.changeBackground(2);
                  controller.changeFontColorToBlack();
                },
                child: CircleAvatar(
                  backgroundColor: QuranConstant.backgroundColors[2],
                )),
            InkWell(
                onTap: () {
                  controller.changeBackground(3);
                  controller.changeFontColorToWhite();
                },
                child: CircleAvatar(
                  backgroundColor: QuranConstant.backgroundColors[3],
                )),
          ]),
          const Divider(),
          CustomButton(
            color: AppColor.secondaryColor,
            onPressed: () => Get.back(),
            textbutton: 'Start',
          ),
        ],
      ),
    );
  }
}
