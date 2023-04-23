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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 600,
      child: ListView.builder(
        itemCount: data[controller.selectedThikr].tEXT!.length,
        itemBuilder: (BuildContext context, i) {
          final repeatCount =
              data[controller.selectedThikr].tEXT![i].rEPEAT!.obs;
          controller.countersList[controller.selectedThikr][i] = repeatCount;

          return GetBuilder<ThikrCatgControllerImp>(
            builder: (_) {
              return ThikrDataCardArabic(
                arabicText:
                    data[controller.selectedThikr].tEXT![i].aRABICTEXT.toString(),
                Catg: index,
                subCatg: i,
              );
            },
          );
        },
      ),
    );
  }
}