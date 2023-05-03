import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/trainerScreen_controller.dart';
import '../../../core/constant/color.dart';
import 'pagecardtrainer.dart';

class PagesContentDialog extends StatelessWidget {
  const PagesContentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrainerScreenController());

    return GetBuilder<TrainerScreenController>(builder: (controller) {
      return SizedBox(
        //color: Color.fromARGB(255, 153, 161, 0),
        height: MediaQuery.of(context).size.height / 1.75,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              // width: 1000,
              child: Obx(
                () => RangeSlider(
                  activeColor: const Color.fromARGB(255, 246, 206, 149),
                  inactiveColor: const Color.fromARGB(255, 250, 240, 227),
                  values: controller.rangeValues,
                  min: 1,
                  max: 604,
                  divisions: 603,
                  onChanged: (RangeValues values) {
                    controller.rangeValues =
                        RangeValues(values.start, values.end);
                  },
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => Text(
                    'from: ${controller.startPageIndex} - to: ${controller.endPageIndex}',
                    style: const TextStyle(fontSize: 13))),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Start",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.thickYellow,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.15,
              child: GridView.builder(
                itemCount: 604,
                itemBuilder: (BuildContext context, int index) {
                  return PageCardTrainer(
                    pageNumb: index + 1,
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
