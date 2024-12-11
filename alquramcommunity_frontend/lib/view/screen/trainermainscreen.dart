import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controller/trainerScreen_controller.dart';
import '../../core/constant/constants.dart';
import '../../core/constant/routes.dart';
import '../widget/home/customappbar.dart';
import '../widget/trainer/floatingbottontrainer.dart';
import '../widget/trainer/setTrainerSettingDialog.dart';

class TrainerMainScreen extends GetView {
  const TrainerMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;

    TrainerScreenController trainerScreenController =
        Get.put(TrainerScreenController());
    trainerScreenController.setContext(context);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoute.home);
          // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

          return false;
        },
        child: Scaffold(
          appBar: AppBar(
              shadowColor: AppColor.grey,
              automaticallyImplyLeading: false,
              //primary: true,
              elevation: 0.0,
              backgroundColor: AppColor.grey,
              title: CustomAppBar(onPressedIcon: () {})
              //titleTextStyle: TextStyle(text),
              ),
          floatingActionButton: const TrainerFloatingButtonsGroup(),
          backgroundColor: AppColor.grey,
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.settings),
                            color: AppColor.black,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SetTrainerSettingDialog();
                                  });
                            },
                          )
                        ],
                      ),
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
                      // SizedBox(height: 30),
                      // Text(
                      //   "${trainerScreenController.ayahTest.value}",
                      //   textDirection: TextDirection.rtl,
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontFamily: "Quran",
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      // SizedBox(height: 25),

                      Text(
                        "${trainerScreenController.showText.value}",
                        textDirection: TextDirection.rtl,
                      ),
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
                    ],
                  ))),
        ));
  }
}
