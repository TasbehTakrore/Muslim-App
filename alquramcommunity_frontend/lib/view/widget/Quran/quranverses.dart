import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

import '../../../controller/quranscreen_controller.dart';

class QuranVerses extends StatelessWidget {
  final int surahindex;
  final int pageindex;

  const QuranVerses(
      {super.key, required this.surahindex, required this.pageindex});

  @override
  Widget build(BuildContext context) {
    Get.put(QuranPageController());

    return GetBuilder<QuranPageController>(builder: (controller) {
      //  controller.setContext(context);

      return Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
              // page verses and page numb
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              textDirection: TextDirection.rtl,
              spacing: 1.5,
              runSpacing: 4,
              children: controller.versesList),
          surahindex == getSurahCountByPage(pageindex + 1) - 1
              ? Text(ArabicNumbers().convert(pageindex + 1),
                  style: TextStyle(fontSize: 15))
              : SizedBox()
        ],
      );
    });
  }
}
