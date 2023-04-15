import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/recitationscreen_controller.dart';
import '../../../core/constant/color.dart';

class ResitationFloatingButtonsGroup extends StatelessWidget {
  const ResitationFloatingButtonsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    RecitationScreenController recitationController =
        Get.put(RecitationScreenController());

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "end",
              onPressed: () {
                recitationController.goToNextPage();
              },
              backgroundColor: AppColor.secondaryColor,
              child: const Icon(Icons.exit_to_app_rounded),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: FloatingActionButton(
                    heroTag: "next",
                    onPressed: () {
                      recitationController.changeOpacity();
                    },
                    backgroundColor: AppColor.primaryColor,
                    child: Obx(()=> Icon(
                      recitationController.nextReload.value,
                    ))
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Obx(
                  () => Container(
                    width: 70,
                    height: 70,
                    child: FloatingActionButton(
                      backgroundColor: recitationController.hintColor.value,
                      onPressed: () {
                        recitationController.showsHint(context);
                      },
                      heroTag: "hint",
                      child: const Icon(Icons.lightbulb_outline),
                    ),
                  ),
                ),
              ],
            ),
            FloatingActionButton(
              heroTag: "auto",
              onPressed: () {
                recitationController.changeOpacity();
              },
              backgroundColor: AppColor.secondaryColor,
              child: const Icon(Icons.auto_mode_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
