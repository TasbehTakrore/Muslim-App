import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import '../../controller/recitationscreen_controller.dart';
import '../../controller/speechRecognition_controller.dart';
import '../../controller/trainerScreen_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/home/customappbar.dart';
import '../widget/logowidget.dart';
import '../widget/recitation/floatingbuttonsgroup.dart';
import '../widget/recitation/recitationqurancontent.dart';
import '../widget/trainer/floatingbottontrainer.dart';

class TrainerMainScreen extends GetView {
  const TrainerMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    TrainerScreenController trainerScreenController =
        Get.put(TrainerScreenController());

    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoute.home);

          return false;
        },
        child: Scaffold(
          floatingActionButton: const TrainerFloatingButtonsGroup(),
          backgroundColor: AppColor.grey,
          body: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Obx(() => Column(
                    //logoWidget(),
                    // ConfettiWidget(
                    //   confettiController: null,
                    // ),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomAppBar(onPressedIcon: () {}),

                      Text(
                        "${trainerScreenController.counter.value}",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 50,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Wrap(
                        spacing: 1.5,
                        runSpacing: 4,
                        direction: Axis.horizontal,
                        textDirection: TextDirection.rtl,
                        alignment: WrapAlignment.start,
                        children: trainerScreenController.wordsWidgetList,
                      ),
                      SizedBox(height: 30),
                      // Text(
                      //   "${trainerScreenController.ayahTest.value}",
                      //   textDirection: TextDirection.rtl,
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontFamily: "Quran",
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(() => IconButton(
                              onPressed: () {
                                trainerScreenController.setOpenMiceIcon();
                                trainerScreenController.startListening(context);

                                print(trainerScreenController.matchFlag);
                                //speechRecognitionController.setCloseMiceIcon();
                              },
                              icon: Icon(
                                trainerScreenController.micIcon.value,
                                color: Colors.green,
                                size: 35,
                              ))),
                          IconButton(
                              onPressed: () {
                                //trainerScreenController.Test();
                                trainerScreenController.showFirstWord(context);
                                //speechRecognitionController.startListening();
                                //speechRecognitionController.setCloseMiceIcon();
                              },
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.blue,
                                size: 35,
                              ))
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${trainerScreenController.showText.value}",
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 20),
                    ],
                  ))),
        ));
  }
}
