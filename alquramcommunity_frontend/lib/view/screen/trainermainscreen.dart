import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import '../../controller/recitationscreen_controller.dart';
import '../../controller/speechRecognition_controller.dart';
import '../../controller/trainerScreen_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/recitation/floatingbuttonsgroup.dart';
import '../widget/recitation/recitationqurancontent.dart';

class TrainerMainScreen extends GetView {
  const TrainerMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final SpeechRecognitionController speechRecognitionController =
        Get.put(SpeechRecognitionController());
    TrainerScreenController trainerScreenController =
        Get.put(TrainerScreenController());

    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoute.home);

          return false;
        },
        child: Scaffold(
          floatingActionButton: const ResitationFloatingButtonsGroup(),
          backgroundColor: AppColor.grey,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(": ${trainerScreenController.ayahTest.value}")),
                ElevatedButton(
                  onPressed: speechRecognitionController.startListening,
                  child: Text("Start Listening"),
                ),
                SizedBox(height: 20),
                Obx(() => Text(
                    "You said: ${speechRecognitionController.text.value}")),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
