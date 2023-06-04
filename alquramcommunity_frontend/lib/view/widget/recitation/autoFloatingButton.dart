import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/recitationscreen_controller.dart';
import '../../../core/constant/color.dart';

class AutoFloatingButton extends StatelessWidget {
  final String hero;
  final int speed;
  const AutoFloatingButton(
      {super.key, required this.hero, required this.speed});

  @override
  Widget build(BuildContext context) {
    CountDownController _controller = CountDownController();
    RecitationScreenController recitationController =
        Get.put(RecitationScreenController());
    return Container(
      width: 35,
      height: 35,
      child: FloatingActionButton(
          heroTag: hero,
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
                        recitationController.autoState(speed == 1 ? 5 : 2);
                        recitationController.showBar();
                        print('Countdown Ended');
                      },
                      onChange: (String timeStamp) {
                        print('Countdown Changed $timeStamp');
                      },
                    ),
                  );
                });
            //Get.toNamed(AppRoute.countDownTimer);
            //recitationController.changeOpacity();
          },
          backgroundColor: AppColor.primaryColor,
          child: speed == 1 ? Text("X1") : Text("X2")),
    );
  }
}
