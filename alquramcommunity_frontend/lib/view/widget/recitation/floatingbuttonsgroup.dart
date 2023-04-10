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

    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 10.0,
          right: 120.0,
          child: FloatingActionButton(
            heroTag: "next",
            onPressed: () {
              recitationController.changeOpacity();
            },
            backgroundColor: AppColor.primaryColor,
            child: const Icon(Icons.done),
          ),
        ),
        Obx(
          () => Positioned(
            bottom: 10.0,
            left: 120.0,
            child: FloatingActionButton(
              backgroundColor: recitationController.hintColor.value,
              onPressed: () {
                recitationController.showsHint(context);
              },
              heroTag: "hint",
              child: const Icon(Icons.lightbulb_outline),
            ),
          ),
        )
      ],
    );
  }
}
