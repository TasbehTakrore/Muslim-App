import 'package:alquramcommunity_frontend/view/widget/Quran/quranverses.dart';
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
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: ListView.separated(
              //physics: NeverScrollableScrollPhysics(),
              itemCount: getSurahCountByPage(indexP + 1),
              itemBuilder: (context, index) {
                // تخزين البيانات الخاصّة بالسورة الواحدة من سور الصّفحة
                controller.setSurahPageData(indexP + 1, index);
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(height: 20),
                  controller.startVerse == 1
                      ? SurahTitleBorder()
                      : PageTitleBorder(),
                  const SizedBox(height: 15),
                  QuranVerses(
                    pageindex: indexP,
                    surahindex: index,
                  )
                ]);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 2))),
    );
  }
}


                  // Stack(alignment: Alignment.center, children: [
                  //   SvgPicture.asset(
                  //     AppImageAsset.surahHead,
                  //     width: 500,
                  //     height: 200,
                  //   ),
                  // ]),