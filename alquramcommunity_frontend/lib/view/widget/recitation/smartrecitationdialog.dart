import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/smartrecitationdialog.dart';
import '../custombuttomlang.dart';

class SmartRecitationDialog extends StatelessWidget {
  final SmartRecitationDialogController controller =
      Get.put(SmartRecitationDialogController());

  SmartRecitationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Choose Pages"),
              Container(
                width: 1000,
                child: Obx(
                  () => RangeSlider(
                    activeColor: Color.fromARGB(255, 246, 206, 149),
                    inactiveColor: Color.fromARGB(255, 250, 240, 227),
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
              Obx(() => Text(
                  'from: ${controller.startPageIndex} - to: ${controller.endPageIndex}',
                  style: TextStyle(fontSize: 13))),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Checkbox(
                        activeColor: AppColor.primaryColor,
                        value: controller.isChecked,
                        onChanged: (bool? value) {
                          controller.isChecked = value!;
                        },
                      )),
                  Text("Hint each 5sec"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                color: AppColor.primaryColor,
                onPressed: () => controller.submitForm(),
                textbutton: 'Start',
              ),
            ],
          ),
        ));
  }
}
