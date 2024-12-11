import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../../../controller/thikrCatgController.dart';
import '../../../data/model/front_models/thikrmodel.dart';
import 'ThikrDataCard.dart';

class ThikrDataList extends StatelessWidget {
  const ThikrDataList({
    Key? key,
    required this.data,
    required this.controller,
    required this.section,
    required this.index,
  }) : super(key: key);

  final List<Thikr> data;
  final ThikrCatgControllerImp controller;
  final section;
  final int index;

  @override
  Widget build(BuildContext context) {
    ThikrCatgControllerImp thikrCatgController = Get.put(ThikrCatgControllerImp());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 600,
      child: ListView.builder(
        itemCount: data[controller.selectedThikr.value].tEXT!.length,
        itemBuilder: (BuildContext context, i) {
       /*   final repeatCount =
              data[controller.selectedThikr.value].tEXT![i].rEPEAT!;
          controller.countersList[controller.selectedThikr.value][i] = repeatCount;
*/
          return GetBuilder<ThikrCatgControllerImp>(
            builder: (controller) {
              return ThikrDataCardArabic(
                arabicText:
                    data[controller.selectedThikr.value].tEXT![i].aRABICTEXT.toString(),
                subCatg: controller.followCounters[controller.selectedThikr.value][i].toString(), catg: i,
              );
            },
          );
        },
      ),
    );
  }
}
