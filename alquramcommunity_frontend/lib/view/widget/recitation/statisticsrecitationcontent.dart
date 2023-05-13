import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../controller/homescreen_controller.dart';
import '../../../controller/recitationscreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';

class statisticsRecitationContent extends StatelessWidget {
  const statisticsRecitationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
    final RecitationScreenController recitationController =
        Get.put(RecitationScreenController());
    return Container(
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
                          const Text(
                            "مدّة جلسة التّسميع",
                            style:
                                TextStyle(fontSize: 20, color: AppColor.black),
                          ),
                          const SizedBox(height: 5),
                          Text(recitationController.durationResult,
                              style: TextStyle(fontSize: 25)),
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
                      Icon(Icons.lightbulb_outline,
                          size: 100, color: AppColor.thickYellow, weight: 5),
                      SizedBox(height: 8),
                      Text(
                          style: TextStyle(fontSize: 18),
                          "${recitationController.hintsCount} تلميحات / ${recitationController.totalReciteVerseesCount} آية"),

//
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
                      
                      

                      CircularPercentIndicator(
                        radius: 50,
                        animation: true,
                        animationDuration: 1000,
                        lineWidth: 8,
                        circularStrokeCap: CircularStrokeCap.round,
                        backgroundColor: Color.fromARGB(32, 252, 204, 92),
                        percent: (recitationController.mistakesCount /
                            recitationController.totalReciteVerseesCount),
                        center: const Text(
                          "الأخطاء",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        progressColor: Color.fromARGB(255, 233, 0, 0),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "${recitationController.mistakesCount} أخطاء / ${recitationController.totalReciteVerseesCount} آية ",
                        style: TextStyle(fontSize: 18),
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
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                            ),
                            children: [

                              
                              TextSpan(
                                text: 'سمّعت في هذه الجلسة ',
                              ),
                              TextSpan(
                                text:
                                    '(${recitationController.totalRecitPageCount}) ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 194, 13, 0),
                                ),
                              ),
                              TextSpan(
                                  text:
                                      "صفحات كاملة، تمنحك القيم في الأعلى مؤشّرًا على مدى إتقانك الحِفظ. \n\n استمرّ! ما زاحم القرآن شيئًا إلّا باركه."),
                            ],
                          ),
                        ),

                        // Text(
                        //         textAlign: TextAlign.center,
                        // ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Get.toNamed(AppRoute.home);
                          homeScreenControllerImp.changePage(2);
                        },
                        label: Text(
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
