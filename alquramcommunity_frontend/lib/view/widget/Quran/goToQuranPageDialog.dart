import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/color.dart';
import '../custombuttomlang.dart';

class GoToQuranPageDialog extends StatelessWidget {
  const GoToQuranPageDialog({super.key});
  @override
  Widget build(BuildContext context) {
    QuranPageController quranPageController = Get.put(QuranPageController());

    int value = quranPageController.getPageIndex() + 1;

    return GetBuilder<QuranPageController>(builder: (controller) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "حرّك لاختيار صفحةٍ تودّ الانتقال إليها",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const Divider(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NumberPicker(
                  itemCount: 3,
                  value: value,
                  minValue: 1,
                  maxValue: 604,
                  step: 1,
                  itemHeight: 50,
                  itemWidth: 50,
                  axis: Axis.horizontal,
                  onChanged: (val) {
                    value = val;
                    controller.updatee();
                  },
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
              ],
            ),
            const Divider(),
            CustomButton(
              color: AppColor.secondaryColor,
              onPressed: () => {controller.goToPage(value)},
              textbutton: 'انتِقال',
            ),
          ],
        ),
      );
    });
  }
}
