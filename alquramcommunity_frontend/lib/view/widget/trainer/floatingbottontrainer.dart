import 'package:alquramcommunity_frontend/controller/trainerScreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controller/recitationscreen_controller.dart';
import '../../../controller/speechRecognition_controller.dart';
import '../../../core/constant/color.dart';

class TrainerFloatingButtonsGroup extends StatelessWidget {
  const TrainerFloatingButtonsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    TrainerScreenController trainerScreenController =
        Get.put(TrainerScreenController());

    return Container(
      //color: Colors.red,
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 20),
          FloatingActionButton(
            heroTag: "end",
            onPressed: () {
              trainerScreenController.statisticsAndEnd();
            },
            backgroundColor: AppColor.primaryColor,
            child: const Icon(Icons.exit_to_app_rounded),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                width: 60,
                child: FloatingActionButton(
                    heroTag: "true",
                    child: Icon(
                      Icons.check,
                      size: 40,
                      //   color: Colors.green,
                    ),
                    backgroundColor: Colors.green,
                    onPressed: () {
                      trainerScreenController.text.value = "";
                      trainerScreenController.trueAnswer();
                    }),
              ),
              SizedBox(width: 8),
              FloatingActionButton(
                  heroTag: "false",
                  child: Icon(
                    Icons.close,
                    size: 38,
                  ),
                  backgroundColor: Colors.red,
                  onPressed: () {
                    trainerScreenController.text.value = "";
                    trainerScreenController.falseAnswer();
                  }),
            ],
          ),
          FloatingActionButton(
              heroTag: "next",
              child: Icon(
                Icons.navigate_next_rounded,
                size: 38,
              ),
              backgroundColor: AppColor.thickYellow,
              onPressed: () {
                trainerScreenController.text.value = "";
                trainerScreenController.testType();
              }),
        ],
      ),
    );
  }
}
