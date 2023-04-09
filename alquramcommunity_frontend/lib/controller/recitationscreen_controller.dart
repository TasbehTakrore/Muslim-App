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
  int index = 0;
  int s = -1;
  MyServices service = Get.put(MyServices());
  int pageWidgetindex = 0;

  int previousVerseCount = 0;

  List<RxDouble>? pageOpacity = [];
  List<List<RxDouble>> savepageOpacity = [];

  emptyLists() {
    pageOpacity!.clear();
    savepageOpacity!.clear();
    previousVerseCount = 0;
    index = 0;
    s = 0;
    pageWidgetindex = 0;
    // s = 0;
    // pageOpacity!.clear();
    // versesList.clear();
    // index = 0;
    // previousVerseCount = 0;
  }

  setPageIndex(int i) {
    pageWidgetindex = i;
    index = 0;
    previousVerseCount = 0;
  }

  changeOpacity() {
    previousVerseCount = 0;
    if (index < savepageOpacity[pageWidgetindex].length) {
      savepageOpacity[pageWidgetindex][index].value = 1.0;
      index = index + 1;
    }
    print("change: $savepageOpacity");
  }

  int getTotalPageCount() {
    return service.recitation.getInt("endPage")! -
        service.recitation.getInt("startPage")! +
        1;
  }

  int getStartPage() {
    return service.recitation.getInt("startPage")!;
  }

  setSurahPageData(int pageNumb, int partindex, int pageWidgetIndex) {
    if (partindex == 0) {
      previousVerseCount = 0;
    } else {
      previousVerseCount += versesCount!;
      print(
          "else ###################################################### $previousVerseCount");
    }
    print("pageNumb: $pageNumb !!");
    surahNumb = getPageData(pageNumb)[partindex]["surah"];
    allVersescount = getVerseCount(surahNumb!);
    startVerse = getPageData(pageNumb)[partindex]["start"];
    endVerse = getPageData(pageNumb)[partindex]["end"];
    versesCount = endVerse! - startVerse! + 1;
    surahName = getSurahNameArabic(surahNumb!);
    pageJuzNumber = getJuzNumber(surahNumb!, startVerse!);

    versesList.clear();
    pageOpacity!.clear();

    print("pre:   ===  $savepageOpacity + $pageWidgetIndex");
    savepageOpacity.add([]);

    for (var i = 0; i < versesCount!; i++) {
      print(" $savepageOpacity + $pageWidgetIndex");
      savepageOpacity[pageWidgetIndex].add(0.02.obs);

      versesList.addAll(
          getVerse(surahNumb!, startVerse! + i, verseEndSymbol: false)
              .split(" ")
              .map((D) => Obx(
                    () => Opacity(
                        opacity: savepageOpacity[pageWidgetIndex]
                                [i + previousVerseCount]
                            .value,
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

    print("===> save $savepageOpacity + ${savepageOpacity.length}");
  }
}
