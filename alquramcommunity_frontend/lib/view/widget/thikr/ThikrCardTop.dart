import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/thikrCatgController.dart';
import '../../../core/constant/color.dart';

class ThikrCardsTop extends StatelessWidget {
  final int catgg;

  const ThikrCardsTop({super.key, required this.catgg, });

  @override
  Widget build(BuildContext context) {
      ThikrCatgControllerImp thikrCatgController = Get.put(ThikrCatgControllerImp());
    return GetBuilder<ThikrCatgControllerImp>(
      builder: (thikrCatgController) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                   thikrCatgController.resetCounter(thikrCatgController.selectedThikr.value, catgg);

                },
                child: const Icon(
                  Icons.refresh,
                  color: AppColor.primaryColor,
                  size: 45,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {

                     thikrCatgController.togglePlayPause(
                      thikrCatgController.data[thikrCatgController.selectedThikr.value].tEXT![catgg].aUDIO!,
                      thikrCatgController.selectedThikr.value,
                      catgg
                      );
                },
                child: Icon(
                  thikrCatgController.isPlaying[thikrCatgController.selectedThikr.value][catgg]==true ? Icons.pause_circle_filled_rounded : Icons.play_circle_fill_rounded,
                  color: AppColor.primaryColor,
                  size: 45,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
