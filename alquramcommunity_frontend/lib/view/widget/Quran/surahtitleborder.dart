import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/quranconst.dart';

class SurahTitleBorder extends StatelessWidget {
  SurahTitleBorder({super.key});
  final QuranPageController quranController = Get.put(QuranPageController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.center,
          height: 70,
          width: double.infinity,
          decoration: const BoxDecoration(
              //color: Colors.red,
              image: DecorationImage(
                  image: AssetImage(AppImageAsset.titleBorder))),
          child: Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "آياتها ${ArabicNumbers().convert(quranController.allVersescount)}",
                        style: GoogleFonts.amiri(
                            fontSize: 10,
                            color: QuranConstant.fontColor.value)),
                    Text("سورة ${quranController.surahName!}",
                        style: GoogleFonts.amiri(
                            fontSize: 25,
                            color: QuranConstant.fontColor.value)),
                    Text(
                        "ترتيبها ${ArabicNumbers().convert(quranController.surahNumb)}",
                        style: GoogleFonts.amiri(
                            fontSize: 10, color: QuranConstant.fontColor.value))
                  ]))),
      const SizedBox(height: 8),
      quranController.surahNumb != 9 && quranController.surahNumb != 1
          ? Text("بِسْـــــمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
              style: GoogleFonts.amiri(fontSize: 18))
          : const SizedBox()
    ]);
  }
}
