import 'package:alquramcommunity_frontend/core/services/services.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

import '../core/constant/color.dart';

class RecitationScreenController extends GetxController {
  //late int totalPageCount;
  RxList<Widget> versesList = <Widget>[].obs;
  int? surahNumb;
  int? startVerse;
  int? endVerse;
  int? versesCount = 0;
  String? surahName;
  int? pageJuzNumber;
  int? allVersescount;
  int? pageIndex = 0;
  int verseIndex = 0;
  int index = 0;
  int previousVerseCount = 0;

  List<RxDouble>? pageOpacity = [];
  // List<List<RxDouble>>? opacity = [];
// 0.02.obs;

  emptyLists() {
    pageOpacity!.clear();
    verseIndex = 0;
    index = 0;
    previousVerseCount = 0;
    //opacity!.clear();
    // pageOpacity = List.filled(100, 0.02.obs);
  }

  setPageIndex(index) {
    pageIndex = index;
    //verseIndex = 0;
  }

  changeOpacity() {
    //print(opacity);
    print("**");
    print(pageIndex);
    print(index);
    pageOpacity![0].value = 1.0;
    index = index + 1;
    print(pageOpacity);
  }

  MyServices service = Get.put(MyServices());

  int getTotalPageCount() {
    return service.recitation.getInt("endPage")! -
        service.recitation.getInt("startPage")! +
        1;
  }

  int getStartPage() {
    return service.recitation.getInt("startPage")!;
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
    ////
    //pageOpacity!.add(0.02.obs);
    for (var i = 0; i < versesCount!; i++) {
      pageOpacity!.add(0.02.obs);
      //verseIndex ++;
      //print(pageOpacity![i]);
      versesList.addAll(
          getVerse(surahNumb!, startVerse! + i, verseEndSymbol: false)
              .split(" ")
              .map((D) => Obx(
                    () => Opacity(
                        opacity: pageOpacity![previousVerseCount].value,
                        child: Text(D,
                            style: TextStyle(
                                color: D.replaceAll(
                                            RegExp('[^\u0621-\u064A ]'), '') ==
                                        "لله"
                                    ? Colors.red
                                    : AppColor.black,
                                fontFamily: "Quran",
                                fontSize: 21,
                                fontWeight: FontWeight.w500))),
                  )));
      previousVerseCount++;
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
    //previousVerseCount += versesCount! - 1;

    // opacity!.add(pageOpacity!);
    print(pageOpacity);
  }
}
