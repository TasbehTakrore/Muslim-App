import 'package:alquramcommunity_frontend/controller/trainerScreen_controller.dart';
import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../controller/homescreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';

class statisticsTrainerContent extends StatelessWidget {
  const statisticsTrainerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final TrainerScreenController trainerScreenController =
        Get.put(TrainerScreenController());
    final HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
    return Container(
        // padding: EdgeInsets.all(0),
        color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
        child: Center(
          child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.alarm,
                          size: 80, color: AppColor.secondaryColor, weight: 50),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const DefaultTextStyle(
                            style:
                                TextStyle(fontSize: 20, color: AppColor.black),
                            child: Text(
                              "مدّة جلسة التدريب",
                            ),
                          ),

                          // const
                          // const SizedBox(height: 5),
                          DefaultTextStyle(
                            child: Text(trainerScreenController.durationResult),
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 2.15,
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.attach_money,
                              size: 100,
                              color: AppColor.thickYellow,
                              weight: 5),
                          SizedBox(height: 8),
                          DefaultTextStyle(
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              child: Text(
                                " + ${trainerScreenController.coins} نقطة جديدة",
                              )
                              // textAlign: TextAlign.center,
                              )
                        ])),
                Container(
                  width: MediaQuery.of(context).size.width / 2.15,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 50,
                        animation: true,
                        animationDuration: 1000,
                        lineWidth: 8,
                        circularStrokeCap: CircularStrokeCap.round,
                        backgroundColor: Color.fromARGB(32, 252, 204, 92),
                        percent: (trainerScreenController.mistakesCount /
                            (trainerScreenController.counter.value - 1)),
                        center: DefaultTextStyle(
                          child: Text("الأخطاء"),
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        progressColor: Color.fromARGB(255, 233, 0, 0),
                      ),
                      SizedBox(height: 12),
                      DefaultTextStyle(
                        child: Text(
                            "${trainerScreenController.mistakesCount} أخطاء / ${trainerScreenController.counter.value - 1} سؤال "),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    //color: Color.fromARGB(42, 25, 108, 52),

                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: DefaultTextStyle(
                            child: Text(
                                "أتتمت في هذه الجلسة التّدريب على (${trainerScreenController.counter.value - 1}) آية، تمنحك القيم في الأعلى مؤشّرًا على مدى إتقانك الحفظ. \n تذكّر، لا خاسر مع القرآن!",
                                textAlign: TextAlign.center),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black)),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Get.toNamed(AppRoute.home);
                          homeScreenControllerImp.changePage(2);
                        },
                        label: const Text(
                          "انتقل إلى قائمة الأخطاء",
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                        icon: Icon(Icons.list_sharp,
                            color: AppColor.secondaryColor),
                      )
                    ],
                  ),
                ),
                EasyElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.home);
                  },
                  height: 70,
                  width: MediaQuery.of(context).size.width / 2,
                  isRounded: true,
                  color: AppColor.secondaryColor,
                  label: "End",
                ),
              ]),
        ));
  }
}
