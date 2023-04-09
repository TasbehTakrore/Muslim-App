import 'package:alquramcommunity_frontend/core/services/services.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:quran/quran.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
  List<List<String>> beginningVerses = [];
  List<String>? verseWords;
  int previousVerseCount = 0;
  List<List<RxDouble>> savepageOpacity = [];
  RxString hint = " ".obs;
  Rx<Color> hintColor = Color.fromARGB(255, 248, 208, 153).obs;
  List<List<Rx<Color>>> verseColor = [];

  bool firstHint = true;

  emptyLists() {
    savepageOpacity.clear();
    beginningVerses.clear();
    verseColor.clear();
    previousVerseCount = 0;
    index = 0;
    s = 0;
    pageWidgetindex = 0;
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
      hintColor.value = Color.fromARGB(255, 248, 208, 153);
      firstHint = true;
    }
    print("index: $index");
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

    print("pre:   ===  $savepageOpacity + $pageWidgetIndex");
    savepageOpacity.add([]);
    beginningVerses.add([]);
    verseColor.add([]);
    for (var i = 0; i < versesCount!; i++) {
      print(" $savepageOpacity + $pageWidgetIndex");
      // savepageOpacity[pageWidgetIndex].add(0.03.obs);

      verseWords = getVerse(surahNumb!, startVerse! + i, verseEndSymbol: false)
          .split(" ");

      for (int R = 0; R < verseWords!.length; R++) {
        if (R == 0) beginningVerses[pageWidgetIndex].add(verseWords![0]);
        print(beginningVerses);
        savepageOpacity[pageWidgetIndex].add(0.03.obs);
        verseColor[pageWidgetIndex].add(Color.fromARGB(255, 0, 0, 0).obs);
        String D = verseWords![R];
        versesList.add(
          Obx(() => Opacity(
                opacity: savepageOpacity[pageWidgetIndex]
                        [i + previousVerseCount]
                    .value,
                child: Text(
                  D,
                  style: TextStyle(
                    color: verseColor[pageWidgetIndex][i + previousVerseCount]
                        .value,
                    fontFamily: "Quran",
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
        );
      }
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

  showsHint(BuildContext context) {
    print(beginningVerses);
    if (index >= (beginningVerses[pageWidgetindex].length)) return;
    if (firstHint) {
      firstHint = false;
      hint = beginningVerses[pageWidgetindex][index].obs;
      hintColor.value = Colors.red;
      //print(beginningVerses[pageWidgetindex].length);
      return showTopSnackBar(
        padding: const EdgeInsets.all(90),
        animationDuration: const Duration(milliseconds: 1000),
        displayDuration: const Duration(microseconds: 100),
        Overlay.of(context),
        Obx(
          () => CustomSnackBar.info(
            textStyle: const TextStyle(
              fontFamily: "Quran",
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white,
            ),
            message: "... ${hint.value} ...",
            backgroundColor: Color.fromARGB(255, 248, 208, 153),
            icon: const Icon(
              Icons.light_mode_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      );
    } else {
      verseColor[pageWidgetindex][index].value = Colors.red;
      print("not first...........");
      changeOpacity();
      firstHint = true;
    }
  }
}
