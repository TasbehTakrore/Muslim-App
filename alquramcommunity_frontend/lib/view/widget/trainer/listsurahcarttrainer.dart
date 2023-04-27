import 'package:alquramcommunity_frontend/view/widget/trainer/surahcardtrainer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/Material.dart';
import 'package:quran/quran.dart';

class ListSurahCardTrainer extends StatelessWidget {
  const ListSurahCardTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.red,
        height: MediaQuery.of(context).size.height / 1.9,
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 114,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  child: SurahCardTrainer(
                    surahName: getSurahNameEnglish(index + 1),
                    placeOfRevelation: getPlaceOfRevelation(index + 1),
                    surahNumber: (index + 1).toString(),
                    verseCount: getVerseCount(index + 1).toString(),
                    startPage: getPageNumber(index + 1, 1) - 1,
                  ));
            }));
  }
}
