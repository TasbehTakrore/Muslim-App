import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/plan_controller.dart';
import '../../../core/constant/constants.dart';

class PartialPlanCard extends StatelessWidget {
  const PartialPlanCard(
      {super.key,
      required this.checkValue,
      required this.visibleValue,
      required this.partialCardData,
      required this.onChange});

  final Rx<bool> checkValue;
  final Rx<bool> visibleValue;
  final String partialCardData;
  final void Function(bool?) onChange;
  @override
  Widget build(BuildContext context) {
    //bool val = false;

    Get.put(PlanController());
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;

    return GetBuilder<PlanController>(
        builder: (controller) => Visibility(
              visible: visibleValue.value,
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      activeColor: AppColor.primaryColor,
                      value: checkValue.value,
                      onChanged: onChange,
                    ),
                    Text(
                      partialCardData,
                      style: TextStyle(fontSize: isLaptopScreen==true? 26:18),
                    ),
                  ],
                ),
              ),
            ));
  }
}
