import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

import '../../../controller/quranscreen_controller.dart';
import '../../../controller/recitationscreen_controller.dart';
import '../Quran/pagetitleborder.dart';
import '../Quran/surahtitleborder.dart';
import 'quranforrecitation.dart';

class RecitationPageContent extends StatelessWidget {
  final int indexP;
  final int indx;
  final BuildContext context;

  const RecitationPageContent(
      {super.key,
      required this.indexP,
      required this.indx,
      required this.context});

  @override
  Widget build(BuildContext context) {
    RecitationScreenController recitationController =
        Get.put(RecitationScreenController());
    QuranPageController quranController = Get.put(QuranPageController());

    return Container(
      padding: const EdgeInsets.only(right: 14, left: 14),
      width: 370,
      child: ListView.separated(
          //physics: const NeverScrollableScrollPhysics(),
          itemCount: getSurahCountByPage(indexP + 1),
          itemBuilder: (context, index) {
            // تخزين البيانات الخاصّة بالسورة الواحدة من سور الصّفحة
            recitationController.setSurahPageData(indexP + 1, index, indx, context);
            quranController.setSurahPageData(indexP + 1, index);
            return Column(children: [
              const SizedBox(height: 30),
              recitationController.startVerse == 1
                  ? SurahTitleBorder()
                  : PageTitleBorder(),
              const SizedBox(height: 15),
              QuranRecitation(surahindex: index, pageindex: indexP),
            ]);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 2)),
    );
  }
}
