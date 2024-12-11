import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/chartsController.dart';
import '../../../core/constant/constants.dart';

class BarChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;

    ChartsController _controller = Get.put(ChartsController());
    return GetBuilder<ChartsController>(
      init: ChartsController(),
      builder: (_controller) {
        return SizedBox(
          height: isLaptopScreen == true
              ? MediaQuery.of(context).size.height / 2.1
              : MediaQuery.of(context).size.height / 2.5,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    " إنجازاتك لهذا الأسبوع",
                    style: TextStyle(
                        fontSize: 25,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColor
                          .grey), // Replace Colors.blue with your desired background color
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        CircleBorder(),
                      ),
                    ),
                    onPressed: _controller.togglePlaying,
                    child: Icon(Icons.refresh, color: AppColor.primaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 5),
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
            ],
          ),
        );
      },
    );
  }
}
