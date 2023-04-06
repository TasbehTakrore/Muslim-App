import 'package:alquramcommunity_frontend/core/constant/color.dart';
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
  int? versesCount;
  String? surahName;
  int? pageJuzNumber;
  List<Widget> versesList = [];
  RxString lastPageAndName = "".obs;

  int? allVersescount;

  changePageIndexAndSurahName(int pageIndex) {
    myServices.quranPage.setInt("lastPageIndex", pageIndex);
    myServices.quranPage.setString(
        "lastSurahName", getSurahName(getPageData(pageIndex + 1)[0]["surah"]));
  }

  // ignore: non_constant_identifier_names
  int getPageIndex() {
    return myServices.quranPage.getInt("lastPageIndex")!;
  }

  bool anyPageOpend() {
    if (myServices.quranPage.getInt("lastPageIndex") == Null) return false;
    return true;
  }

  RxString getLastOpenedEng() {
    int? index;
    if (anyPageOpend() == true) {
      index = myServices.quranPage.getInt("lastPageIndex");
      //update();
      lastPageAndName =
          "${myServices.quranPage.getString("lastSurahName")} - page ${index! + 1}"
              .obs;
      return lastPageAndName;
    } else
      return "".obs;
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
      //versesList.add(
      // Expanded(child: child)
      //   getVerse(surahNumb!, startVerse! + i, verseEndSymbol: false)
      //     );

      versesList.addAll(
          getVerse(surahNumb!, startVerse! + i, verseEndSymbol: false)
              .split(" ")
              .map(
                (D) => Text(D,
                    style: TextStyle(
                      color:
                          D.replaceAll(RegExp('[^\u0621-\u064A ]'), '') == "لله"
                              ? Colors.red
                              : AppColor.black,
                      fontFamily: "Quran",
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      //  GoogleFonts.amiri(
                      //   fontSize: 20,
                      //   //fontWeight: FontWeight.bold
                      // )
                    )),
              ));
      versesList.add(InkWell(
        onTap: () => () {},
        child: Text(
          key: UniqueKey(),
          getVerseEndSymbol(startVerse! + i),
          style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 41, 119, 97),
              fontWeight: FontWeight.w600),
        ),
      ));
    }
  }

  getVerses() {
    // for (var i = 0; i < 10; i++) {
    //   childs.add(new Text("hiii"));
    // }
  }
}
