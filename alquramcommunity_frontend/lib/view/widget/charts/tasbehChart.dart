import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:alquramcommunity_frontend/view/widget/charts/indicator.dart';
import '../../../controller/auth/chartsController.dart';
import '../../../core/constant/color.dart';
/*
 
class PieChartScreen extends StatelessWidget {
  final ChartsController controller = Get.put(ChartsController());

   PieChartScreen({super.key});


  @override
  Widget build(BuildContext context) {
        return GetBuilder<ChartsController>(
      builder: (controller) {
        return AspectRatio(
          aspectRatio: 1.3,
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
          
                        Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                        Text(" إنجاز التسبيح ليوم أمس",style: TextStyle(fontSize: 25,color: AppColor.primaryColor,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Column(
                          children: [
                            Indicator(
                            color: Colors.blue,
                            text: 'First',
                            isSquare: true,
                            ),
                               SizedBox(
                        height: 4,
                        ),
                        Indicator(
                        color: Colors.yellow,
                        text: 'Second',
                        isSquare: true,
                        ),
                        SizedBox(
                        height: 4,
                        ),
                        Indicator(
                        color: Colors.purple,
                        text: 'Third',
                        isSquare: true,
                        ),
                        SizedBox(
                        height: 4,
                        ),
                        Indicator(
                        color: AppColor.thickYellow,
                        text: 'Fourth',
                        isSquare: true,
                        ),
                        SizedBox(
                        height: 18,
                        ),
                          ],
                        ),
                        Column(
                          children: [
    AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              controller.updateTouchedIndex(event, pieTouchResponse);
            },
          ),
          borderData: FlBorderData(
            show: true,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 30,
            sections: controller.showingSections(),
            ),
            ),
            ),
                     
                          ],
                        )
                          ],
                        )
                        ],
                        ),
                        const SizedBox(
                        width: 28,
                        ),
                        ],
                        ),
                        );
                        },
                        );
                        }
                        }

*/


