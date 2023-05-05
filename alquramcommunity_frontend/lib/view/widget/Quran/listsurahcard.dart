import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/view/widget/Quran/surahcard.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

class ListSurahCard extends StatelessWidget {
  const ListSurahCard({super.key});

  @override
  Widget build(BuildContext context) {
    QuranPageController quranPageController = Get.put(QuranPageController());
    quranPageController.getMistakes();
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 114,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  child: SurahCard(
                    surahName: getSurahNameEnglish(index + 1),
                    placeOfRevelation: getPlaceOfRevelation(index + 1),
                    surahNumber: (index + 1).toString(),
                    verseCount: getVerseCount(index + 1).toString(),
                    startPage: getPageNumber(index + 1, 1) - 1,
                  ));
            }));
  }
}
