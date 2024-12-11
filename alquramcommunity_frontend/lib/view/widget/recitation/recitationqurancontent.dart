import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

import '../../../controller/quranscreen_controller.dart';
import '../../../controller/recitationscreen_controller.dart';
import '../../../core/constant/constants.dart';
import '../Quran/pagetitleborder.dart';
import '../Quran/surahtitleborder.dart';
import 'quranforrecitation.dart';

class RecitationPageContent extends StatelessWidget {
  final int indexP;

  const RecitationPageContent({super.key, required this.indexP});

  @override
  Widget build(BuildContext context) {
    QuranPageController quranController = Get.put(QuranPageController());
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;
    Get.put(RecitationScreenController());
    return GetBuilder<RecitationScreenController>(
      builder: (controller) => Container(
          padding: isLaptopScreen == true
              ? EdgeInsets.symmetric(horizontal: screenWidth / 4)
              : EdgeInsets.only(left: 14, right: 14),
          child: ListView.separated(
              //physics: NeverScrollableScrollPhysics(),
              itemCount: getSurahCountByPage(indexP + 1),
              itemBuilder: (context, indexPart) {
                // تخزين البيانات الخاصّة بالسورة الواحدة من سور الصّفحة
                controller.setSurahPageData(indexP + 1, indexPart, indexP,
                    context, getSurahCountByPage(indexP + 1));
                quranController.setSurahPageData(indexP + 1, indexPart);
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(height: 20),
                  controller.startVerse == 1
                      ? SurahTitleBorder()
                      : PageTitleBorder(),
                  const SizedBox(height: 15),
                  QuranRecitation(
                    pageindex: indexP,
                    surahindex: indexPart,
                  )
                ]);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 2))),
    );
  }
}
