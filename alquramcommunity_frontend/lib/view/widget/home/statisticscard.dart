import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/chartsController.dart';
import '../charts/statisticsDown.dart';
import '../charts/tasbehChart.dart';
import '../charts/weekChart.dart';
import 'package:alquramcommunity_frontend/core/constant/constants.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;
    ChartsController _controller = Get.put(ChartsController());

    return GetBuilder<ChartsController>(
        init: ChartsController(),
        builder: (_controller) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.grey,
            ),
            height: isLaptopScreen == true
                ? MediaQuery.of(context).size.height * 1.2
                : 400,
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //   BarChartPage(),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        " إنجازاتك لهذا الأسبوع",
                        style: TextStyle(
                            fontSize: 25,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      // ElevatedButton(
                      //   style: ButtonStyle(
                      //     backgroundColor: MaterialStateProperty.all<Color>(AppColor
                      //         .grey), // Replace Colors.blue with your desired background color
                      //     shape: MaterialStateProperty.all<OutlinedBorder>(
                      //       CircleBorder(),
                      //     ),
                      //   ),
                      //   onPressed: _controller.togglePlaying,
                      //   child:
                      //       Icon(Icons.refresh, color: AppColor.primaryColor),
                      // ),

                      SizedBox(height: 15),
                      Text(
                        "يعرض هذا المخطط إنجازاتك لهذا الأسبوع، بالنقر على أي من الأعمدة، يمكنك الاطلاع على عدد المهام المنجزة مقارنة بعدد المهام الفعلي ",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      AspectRatio(
                        aspectRatio: isLaptopScreen == true ? 3 : 2.2,
                        child: BarChart(
                          _controller.isPlaying
                              ? _controller.randomData()
                              : _controller.mainBarData(),
                          swapAnimationDuration: _controller.animDuration,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Divider(),

                      SizedBox(height: 3),
                      // StatisticDown(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
