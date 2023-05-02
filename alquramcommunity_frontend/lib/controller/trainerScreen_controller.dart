import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

import '../core/services/services.dart';

class TrainerScreenController extends GetxController {
  RxString ayahTest = "بسم الله".obs;

  MyServices service = Get.put(MyServices());

  int juzNumber = 0;
  int surahNumb = 0;
  int index = 1;
  int verseCount = 0;
  List<String> ayahList = [];
  void changeIndex(int v) {
    index = v;
    update();
  }

  int getIndex() {
    return index;
  }

  changeJuzIndex(int juzIndex) {
    juzNumber = juzIndex;
    print(juzNumber);
    prepareTestDataForJuz();

    //service.recitation.setInt("surahTrainerIndex", pageIndex);
  }

  prepareTestDataForJuz() {
    print("prepareTestDataForJuz");
  }

  prepareTestDataForSurah() {
    ayahList.clear();
    verseCount = getVerseCount(surahNumb);
    print("verseCount $verseCount");
    for (int i = 0; i < verseCount; i++) {
      ayahList.add(getVerse(surahNumb, i + 1, verseEndSymbol: true));
    }
    print(ayahList);
    print(searchWords(["سَوَآءٌ"]));
  }

  changeSurahIndex(int surahIndex) {
    surahNumb = surahIndex;
    print(surahNumb);
    prepareTestDataForSurah();
    print(quranJuzList[5]['start']);

    //service.recitation.setInt("surahTrainerIndex", pageIndex);
  }

  final _rangeValues = const RangeValues(1, 604).obs;

  set rangeValues(RangeValues value) => _rangeValues.value = value;
  RangeValues get rangeValues => _rangeValues.value;

  int get startPageIndex => rangeValues.start.round();
  int get endPageIndex => rangeValues.end.round();

  final List<Map<String, int>> quranJuzList = [
    {"start": 1, "end": 20},
    {"start": 21, "end": 40},
    {"start": 41, "end": 60},
    {"start": 61, "end": 80},
    {"start": 81, "end": 100},
    {"start": 101, "end": 120},
    {"start": 121, "end": 140},
    {"start": 141, "end": 160},
    {"start": 161, "end": 180},
    {"start": 181, "end": 200},
    {"start": 201, "end": 220},
    {"start": 221, "end": 240},
    {"start": 241, "end": 260},
    {"start": 261, "end": 280},
    {"start": 281, "end": 300},
    {"start": 301, "end": 320},
    {"start": 321, "end": 340},
    {"start": 341, "end": 360},
    {"start": 361, "end": 380},
    {"start": 381, "end": 400},
    {"start": 401, "end": 420},
    {"start": 421, "end": 440},
    {"start": 441, "end": 460},
    {"start": 461, "end": 480},
    {"start": 481, "end": 500},
    {"start": 501, "end": 520},
    {"start": 521, "end": 540},
    {"start": 541, "end": 560},
    {"start": 561, "end": 580},
    {"start": 581, "end": 600},
  ];
}
