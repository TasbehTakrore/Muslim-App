import 'dart:math';
import 'package:alquramcommunity_frontend/controller/auth/plan_controller.dart';
import 'package:alquramcommunity_frontend/core/services/tasbeh_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/services/plan_services.dart';
import '../../core/services/services.dart';

MyServices myServices = Get.put(MyServices());
// PlanServices planServices = Get.put(PlanServices());
PlanController planController = Get.put(PlanController());
TasbehServices tasbehServices = Get.put(TasbehServices());

class ChartsController extends GetxController {
  ScrollController scrollController = ScrollController();

// ************************* Start week chart***********************//
  RxInt touchedIndex = RxInt(-1);
  bool isPlaying = false;
  final Duration animDuration = const Duration(milliseconds: 250);
  final int x = planServices.weekData() - 1;
  // Colors part
  List<Color> get availableColors => const <Color>[
        Colors.purple,
        Colors.yellow,
        Colors.blue,
        Colors.orange,
        Colors.pink,
        Colors.red,
        Colors.green,
      ];
  final Color barBackgroundColor = Color.fromARGB(162, 158, 158, 158);
  final Color barColor = Color.fromARGB(232, 56, 67, 214);
  final Color touchedBarColor = AppColor.thickYellow;
  bool isFunctionExecuted = false;

  @override
  void onInit() {
    super.onInit();
    planServices.dayByDay = [
      [0, 0],
      [0, 0],
      [0, 0],
      [0, 0],
      [0, 0],
      [0, 0],
      [0, 0]
    ];
    refreshState();

    scrollController.addListener(() {
      if (!isFunctionExecuted &&
          scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 150) {
        isFunctionExecuted = true;
        togglePlaying();
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");

        // تنفيذ الوظيفة التي ترغب فيها عند الوصول إلى الجزء المحدد
      } else if (scrollController.position.pixels <=
          scrollController.position.maxScrollExtent - 180) {
        print("@@@@@@@@@@");
        isFunctionExecuted = false;
      }
    });
  }

  void togglePlaying() {
    print("insideToggle");
    isPlaying = !isPlaying;
    update();
    refreshState();

    if (isPlaying) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        togglePlaying();
      });
    }
  }

  BarChartGroupData makeGroupData(int x, double y,
      {bool isTouched = false,
      required Color barColor,
      double width = 22,
      List<int> showTooltips = const []}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y - 1 : y,
          color: isTouched ? touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: touchedBarColor.withOpacity(0.7))
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 15,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(7, (i) {
      switch (i) {
        case 0:
          return makeGroupData(
              0,
              planServices.dayByDay[6][0] == 0
                  ? 0.5
                  : (planServices.dayByDay[6][0] * 15) /
                      planServices.dayByDay[6][1],
              isTouched: i == touchedIndex.value,
              barColor: AppColor.primaryColor);
        case 1:
          return makeGroupData(
              1,
              planServices.dayByDay[5][0] == 0
                  ? 0.5
                  : (planServices.dayByDay[5][0] * 15) /
                      planServices.dayByDay[5][1],
              isTouched: i == touchedIndex.value,
              barColor: AppColor.primaryColor);
        case 2:
          return makeGroupData(
              2,
              planServices.dayByDay[4][0] == 0
                  ? 0.5
                  : (planServices.dayByDay[4][0] * 15) /
                      planServices.dayByDay[4][1],
              isTouched: i == touchedIndex.value,
              barColor: AppColor.primaryColor);
        case 3:
          return makeGroupData(
              3,
              planServices.dayByDay[3][0] == 0
                  ? 0.5
                  : (planServices.dayByDay[3][0] * 15) /
                      planServices.dayByDay[3][1],
              isTouched: i == touchedIndex.value,
              barColor: AppColor.primaryColor);
        case 4:
          return makeGroupData(
              4,
              planServices.dayByDay[2][0] == 0
                  ? 0.5
                  : (planServices.dayByDay[2][0] * 15) /
                      planServices.dayByDay[2][1],
              isTouched: i == touchedIndex.value,
              barColor: AppColor.primaryColor);
        case 5:
          return makeGroupData(
              5,
              planServices.dayByDay[1][0] == 0
                  ? 0.5
                  : (planServices.dayByDay[1][0] * 15) /
                      planServices.dayByDay[1][1],
              isTouched: i == touchedIndex.value,
              barColor: AppColor.primaryColor);
        case 6:
          return makeGroupData(
              6,
              planServices.dayByDay[0][0] == 0
                  ? 0.5
                  : (planServices.dayByDay[0][0] * 15) /
                      planServices.dayByDay[0][1],
              isTouched: i == touchedIndex.value,
              barColor: AppColor.primaryColor);
        default:
          throw Error();
      }
    });
  }

  BarChartData mainBarData() {
    int i = 0;
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: AppColor.secondaryColor,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x.toInt()) {
              case 6:
                weekDay = 'السبت';
                i = 0;
                break;
              case 5:
                weekDay = 'الأحد';
                i = 1;
                break;
              case 4:
                weekDay = 'الاثنين';
                i = 2;
                break;
              case 3:
                weekDay = 'الثلاثاء';
                i = 3;
                break;
              case 2:
                weekDay = 'الأربعاء';
                i = 4;
                break;
              case 1:
                weekDay = 'الخميس';
                i = 5;
                break;
              case 0:
                weekDay = 'الجمعة';
                i = 6;
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              TextStyle(
                color: Color.fromARGB(255, 247, 245, 245),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      ('${planServices.dayByDay[i][0]} / ${planServices.dayByDay[i][1]}'),
                  style: TextStyle(
                    color: touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (event, barTouchResponse) {
          if (!event.isInterestedForInteractions ||
              barTouchResponse == null ||
              barTouchResponse.spot == null) {
            touchedIndex.value = -1;
            return;
          }
          touchedIndex.value = (barTouchResponse.spot!.touchedBarGroupIndex);
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 6:
        text = const Text('س', style: style);
        break;
      case 5:
        text = const Text('أ', style: style);
        break;
      case 4:
        text = const Text('ن', style: style);
        break;
      case 3:
        text = const Text('ث', style: style);
        // text = const Text('ث', style: style);
        break;
      case 2:
        text = const Text('ع', style: style);
        break;
      case 1:
        text = const Text('خ', style: style);
        break;
      case 0:
        text = const Text('ج', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(enabled: false),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: List.generate(
        7,
        (i) => makeGroupData(
          i,
          Random().nextInt(15).toDouble() + 1,
          isTouched: i == touchedIndex.value,
          barColor: availableColors[Random().nextInt(6)],
        ),
      ),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    update();
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 5),
    );
    if (isPlaying) {
      await refreshState();
    }
  }

// ************************* End week chart***********************//

// ************************* Start tasbeh chart***********************//

  Future<int> getTasbehData() async {
    final userId = myServices.sharedPreferences.getInt("user_id") ?? 0;
    int userTasbeh = await tasbehServices.getUserTasbeh(userId);
    print("dddddd${userTasbeh}");
    return userTasbeh;
  }

  RxInt tasbehData = 0.obs;
  Future<void> fetchTasbehData() async {
    // Generate a random number between 0 and 100 for 1 second
    final random = Random();
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      tasbehData.value = random.nextInt(101); // Update with a random number
    }

    // Fetch the actual data
    int fetchedData = await getTasbehData();
    tasbehData.value = fetchedData;
  }

  bool isFlipped = false;

  void flipCard() {
    isFlipped = !isFlipped;
  }

/*
  RxInt touchedIndex2 = RxInt(-1);

  void updateTouchedIndex(FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
    if (!event.isInterestedForInteractions ||
        pieTouchResponse == null ||
        pieTouchResponse.touchedSection == null) {
      touchedIndex2.value = -1;
    } else {
      touchedIndex2.value = pieTouchResponse.touchedSection!.touchedSectionIndex;
    }
  }

  List<PieChartSectionData> showingSections() {
    final int currentIndex = touchedIndex2.value;
    return List.generate(4, (i) {
      final isTouched = i == currentIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.red,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppColor.thickYellow,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

*/
}
