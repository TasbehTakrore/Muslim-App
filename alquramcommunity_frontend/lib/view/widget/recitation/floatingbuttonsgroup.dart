import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controller/recitationscreen_controller.dart';
import '../../../core/constant/color.dart';

class ResitationFloatingButtonsGroup extends StatelessWidget {
  const ResitationFloatingButtonsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    RecitationScreenController recitationController =
        Get.put(RecitationScreenController());
    CountDownController _controller = CountDownController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Visibility(
              visible: recitationController.visibleBar.value,
              child: Container(
                padding: const EdgeInsets.all(15),
                //color: Colors.amber,
                width: MediaQuery.of(context).size.width / 1.3,
                child: LinearPercentIndicator(
                  percent: recitationController.percent!.value,
                  width: MediaQuery.of(context).size.width / 1.5,
                  lineHeight: 16,
                  animation: false,
                  progressColor: recitationController.percent!.value < 0.5
                      ? Color.fromARGB(193, 252, 204, 92)
                      : recitationController.percent!.value < 0.75
                          ? Color.fromARGB(255, 248, 141, 47)
                          : Colors.red,
                  backgroundColor: Color(0xFFE0E3E7),
                  barRadius: Radius.circular(12),
                  padding: EdgeInsets.zero,
                ),
              ),
            )),
        Container(
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
                    recitationController.statisticsAndEnd();
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
                            recitationController.changeOpacity(false);
                          },
                          backgroundColor: AppColor.primaryColor,
                          child: Obx(() => Icon(
                                recitationController.nextReload.value,
                              ))),
                    ),
                    const SizedBox(
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
                    recitationController.reStartPage();
                    recitationController.cancleTimer();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            child: CircularCountDownTimer(
                              duration: 3,
                              initialDuration: 0,
                              controller: _controller,
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 2,
                              ringColor: Colors.transparent,
                              fillColor: AppColor.secondaryColor,
                              backgroundColor: Colors.transparent,
                              backgroundGradient: null,
                              strokeWidth: 20.0,
                              strokeCap: StrokeCap.round,
                              textStyle: const TextStyle(
                                  fontSize: 33.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textFormat: CountdownTextFormat.S,
                              isReverse: true,
                              isReverseAnimation: false,
                              isTimerTextShown: true,
                              autoStart: true,
                              onStart: () {
                                print('Countdown Started');
                              },
                              onComplete: () {
                                Get.back();
                                recitationController.autoState();
                                recitationController.showBar();
                                print('Countdown Ended');
                              },
                              onChange: (String timeStamp) {
                                print('Countdown Changed $timeStamp');
                              },
                            ),
                          );
                          _controller.start();
                        });
                    //Get.toNamed(AppRoute.countDownTimer);
                    //recitationController.changeOpacity();
                  },
                  backgroundColor: AppColor.secondaryColor,
                  child: const Icon(Icons.auto_mode_rounded),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
