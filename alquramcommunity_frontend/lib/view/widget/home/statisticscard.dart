import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../charts/statisticsDown.dart';
import '../charts/tasbehChart.dart';
import '../charts/weekChart.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.grey,
        // gradient: const LinearGradient(
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomLeft,
        //   colors: [Color(0xff2C8066), Color(0xff5FCFAE)],
        // )
      ),
      height: 500,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                BarChartPage(),
                SizedBox(height: 3),
                StatisticDown(),
          
              ],
            ),
          ),
        ],
      ),
    );
  }
}