import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

import '../../../controller/quranscreen_controller.dart';
import 'pagetitleborder.dart';
import 'surahtitleborder.dart';

class QuranPageContent extends StatelessWidget {
  final int indexP;

  QuranPageContent({super.key, required this.indexP});

  @override
  Widget build(BuildContext context) {
    Get.put(QuranPageController());
    return GetBuilder<QuranPageController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.all(14),
              width: 370,
              child: Center(
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: getSurahCountByPage(indexP + 1),
                      itemBuilder: (context, index) {
                        // تخزين البيانات الخاصّة بالسورة الواحدة من سور الصّفحة
                        controller.setSurahPageData(indexP + 1, index);
                        return Column(children: [
                          const SizedBox(height: 2),
                          controller.startVerse == 1
                              ? SurahTitleBorder()
                              : PageTitleBorder(),
                          const SizedBox(height: 15),
                          Wrap(
                              // page verses and page numb
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              textDirection: TextDirection.rtl,
                              spacing: 3,
                              children: controller.versesList),
                          index == getSurahCountByPage(indexP + 1) - 1
                              ? Text(ArabicNumbers().convert(indexP + 1),
                                  style: TextStyle(fontSize: 15))
                              : SizedBox()
                        ]);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 2))),
            ));
  }
}


                  // Stack(alignment: Alignment.center, children: [
                  //   SvgPicture.asset(
                  //     AppImageAsset.surahHead,
                  //     width: 500,
                  //     height: 200,
                  //   ),
                  // ]),