import 'dart:math';

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

import '../core/localization/changelocal.dart';
import '../view/widget/Quran/tafser.dart';

class RandomVerseController extends GetxController {
  String todeyVerse = "";
  String todayVerseTafseer = "";
  String todayVerseTafseerEng = "";
  Random? random;
  int? randSurah;
  int? randAyah;
  int? verseCount;
  final LocaleController localeController = Get.put(LocaleController());

  @override
  void onInit() {
    random = new Random();
    randSurah = 1 + random!.nextInt(115 - 1);
    verseCount = getVerseCount(randSurah!);
    randAyah = 1 + random!.nextInt(verseCount!);
    print("randSurah: $randSurah : randAyah: $randAyah");

    todeyVerse = "\uFD3F" + getVerse(randSurah!, randAyah!) + "\uFD3E";
    todayVerseTafseer =
        "${(tafser[0][randSurah != 1 ? (getVerseCount(randAyah! - 1) + randAyah!).toString() : (randAyah).toString()] as Map<String, Object>)["verse"]} \n(التّفسير المُيسّر، سورة ${getSurahNameArabic(randSurah!)}، الآية: ${ArabicNumbers().convert(randAyah)})";
    todayVerseTafseerEng =
        getVerseTranslation(randSurah!, randAyah!, verseEndSymbol: false);
    print("->" + todeyVerse);

    // TODO: implement onInit
    super.onInit();
  }

  bool englishLang() {
    return localeController.myServices.sharedPreferences.getString("lang") ==
            "en"
        ? true
        : false;
  }

  String getRandom() {
    randSurah = 1 + random!.nextInt(115 - 1);
    verseCount = getVerseCount(randSurah!);
    randAyah = 1 + random!.nextInt(verseCount!);
    print("randSurah:@@@@@@@@@@@@@@@@@@@@@@@ $randSurah : randAyah: $randAyah");

    print("->" + getVerse(randSurah!, randAyah!));
    todeyVerse = getVerse(randSurah!, randAyah!);
    print("______________________________ ${todeyVerse.length}");
    return todeyVerse;
  }
}
