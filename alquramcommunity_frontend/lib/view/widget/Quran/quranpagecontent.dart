import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';

import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/imageasset.dart';
import 'pagetitleborder.dart';
import 'surahtitleborder.dart';

class QuranPageContent extends StatelessWidget {
  final int indexP;
  final QuranPageController quranController = Get.put(QuranPageController());

  QuranPageContent({super.key, required this.indexP});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      width: 370,
      child: Center(
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: getSurahCountByPage(indexP + 1),
              itemBuilder: (context, index) {
                // تخزين البيانات الخاصّة بالسورة الواحدة من سور الصّفحة
                quranController.setSurahPageData(indexP + 1, index);
                return Column(children: [
                  const SizedBox(height: 20),
                  quranController.startVerse == 1
                      ? SurahTitleBorder()
                      : PageTitleBorder(),
                  const SizedBox(height: 20),
                  Wrap(
                      // page verses and page numb
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: quranController.versesList),
                  index == getSurahCountByPage(indexP + 1) - 1
                      ? Text(ArabicNumbers().convert(indexP + 1),
                          style: TextStyle(fontSize: 15))
                      : SizedBox()
                ]);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 2))),
    );
  }
}
