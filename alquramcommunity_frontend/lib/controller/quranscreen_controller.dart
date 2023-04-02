import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';

import '../core/services/services.dart';

class QuranPageController extends GetxController {
  MyServices myServices = Get.put(MyServices());
  int? surahNumb;
  int? startVerse;
  int? endVerse;
  List<InkWell> versesList = [];
  int? versesCount;
  String? surahName;
  int? pageJuzNumber;
  int? allVersescount;

  // List<Wrap> versesList = [];

  changePageIndex(int pageIndex) {
    myServices.quranPage.setInt("pageIndex", pageIndex);
  }

  // ignore: non_constant_identifier_names
  int getPageIndex() {
    return myServices.quranPage.getInt("pageIndex")!;
  }

  setSurahPageData(int pageNumb, int index) {
    surahNumb = getPageData(pageNumb)[index]["surah"];
    allVersescount = getVerseCount(surahNumb!);
    startVerse = getPageData(pageNumb)[index]["start"];
    endVerse = getPageData(pageNumb)[index]["end"];
    versesCount = endVerse! - startVerse! + 1;
    surahName = getSurahNameArabic(surahNumb!);
    pageJuzNumber = getJuzNumber(surahNumb!, startVerse!);
    versesList.clear();

    for (var i = 0; i < versesCount!; i++) {
      versesList.addAll(
          getVerse(surahNumb!, startVerse! + i, verseEndSymbol: false)
              .split(" ")
              .map((e) => InkWell(
                  onTap: () => () {},
                  child: Container(
                      padding: const EdgeInsets.only(left: 3, bottom: 5),
                      child: Text(e, style: GoogleFonts.amiri(fontSize: 18)))))
              .toList());
      versesList.add(InkWell(
          onTap: () => () {},
          child: Container(
              padding: const EdgeInsets.only(left: 5, bottom: 5),
              child: Text(
                getVerseEndSymbol(startVerse! + i),
                style: const TextStyle(fontSize: 20),
              ))));

// هايّ الصحّ كتقسمية آيات مش كلمات.
      // words.add(Wrap(
      //     direction: Axis.horizontal,
      //     textDirection: TextDirection.rtl,
      //     children:
      //         "${getVerse(surahNumb!, startVerse! + i, verseEndSymbol: true)}"
      //             .split(" ")
      //             .map((e) => InkWell(
      //                   onLongPress: () => Get.toNamed(AppRoute.home),
      //                   child: Text(e),
      //                   //style: TextStyle(fontFamily: "Quran", fontSize: 18),
      //                 ))
      //             .toList()));

      // words.addAll("${getVerse(surahNumb!, startVerse! + i)}"
      //     .split(" ")
      //     .map((e) => Text(e))
      //     .toList()); // list of words of verse
      // versesList.add(new Wrap(
      //   direction: Axis.horizontal,
      //   children: words,
      // ));
      //print("${words.length}");

      // versesList.add(new words.map((e) => Text(e)).toList()

      //     //Text("${getVerse(surahNumb!, startVerse! + i)}")

      //     );
    }
  }

  // versesList.add(new RichText(
  //         text: TextSpan(children: [
  //   TextSpan(text: "${getVerse(surahNumb!, startVerse! + i)}")
  // ]))

  getVerses() {
    // for (var i = 0; i < 10; i++) {
    //   childs.add(new Text("hiii"));
    // }
  }
}
