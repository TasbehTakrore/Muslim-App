import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

import '../../../controller/trainerdialog_controller.dart';

class TrainerDialog extends StatelessWidget {
  const TrainerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrainerDialogController());

    return GetBuilder<TrainerDialogController>(
      builder: (controller) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  //color: Colors.amber,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: CustomSlidingSegmentedControl<int>(
                    fixedWidth: MediaQuery.of(context).size.width / 3.02,
                    height: 39,
                    initialValue: 1,
                    children: {
                      1: Text('My mistakes'),
                      2: Text('general'),
                    },
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    thumbDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          offset: const Offset(
                            0.0,
                            2.0,
                          ),
                        ),
                      ],
                    ),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInToLinear,
                    onValueChanged: (v) {
                      print(v);
                    },
                  ),

                  // ListView(
                  //   children: const [],
                  // ),
                ),
                Container(
                  color: Colors.red,
                  height: 200,
                )
              ],
            ));
      },
    );
  }
}
