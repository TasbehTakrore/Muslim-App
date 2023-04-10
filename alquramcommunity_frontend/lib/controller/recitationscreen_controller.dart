import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/services/services.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../core/localization/changelocal.dart';

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
  MyServices service = Get.put(MyServices());
  int pageWidgetindex = 0;
  List<List<String>> beginningVerses = [];
  List<String>? verseWords;
  int previousVerseCount = 0;
  List<List<RxDouble>> savepageOpacity = [];
  RxString hint = " ".obs;
  Rx<Color> hintColor = AppColor.thickYellow.obs;
  List<List<Rx<Color>>> verseColor = [];

  bool firstHint = true;
  final LocaleController localeController = Get.put(LocaleController());

  EnglishLang() {
    return localeController.myServices.sharedPreferences.getString("lang") ==
            "en"
        ? true
        : false;
  }

  emptyLists() {
    savepageOpacity.clear();
    beginningVerses.clear();
    verseColor.clear();
    previousVerseCount = 0;
    index = 0;
    pageWidgetindex = 0;
    hintColor = AppColor.thickYellow.obs;
    firstHint = true;
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
      hintColor.value = AppColor.thickYellow;
      firstHint = true;
    }
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
    }
    surahNumb = getPageData(pageNumb)[partindex]["surah"];
    allVersescount = getVerseCount(surahNumb!);
    startVerse = getPageData(pageNumb)[partindex]["start"];
    endVerse = getPageData(pageNumb)[partindex]["end"];
    versesCount = endVerse! - startVerse! + 1;
    surahName = getSurahNameArabic(surahNumb!);
    pageJuzNumber = getJuzNumber(surahNumb!, startVerse!);

    versesList.clear();

    savepageOpacity.add([]);
    beginningVerses.add([]);
    verseColor.add([]);

    for (var i = 0; i < versesCount!; i++) {
      verseWords = getVerse(surahNumb!, startVerse! + i, verseEndSymbol: false)
          .split(" ");
      for (int R = 0; R < verseWords!.length; R++) {
        if (R == 0) beginningVerses[pageWidgetIndex].add(verseWords![0]);
        savepageOpacity[pageWidgetIndex].add(0.03.obs);
        verseColor[pageWidgetIndex].add(Colors.black.obs);
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
    if (index >= (beginningVerses[pageWidgetindex].length)) return;
    if (firstHint) {
      firstHint = false;
      hint = beginningVerses[pageWidgetindex][index].obs;
      hintColor.value = Colors.red;
      return showTopSnackBar(
          padding: const EdgeInsets.all(90),
          animationDuration: const Duration(milliseconds: 1000),
          displayDuration: const Duration(microseconds: 100),
          Overlay.of(context),
          Obx(() => CustomSnackBar.info(
              textStyle: const TextStyle(
                fontFamily: "Quran",
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
              message: "... ${hint.value} ...",
              backgroundColor: AppColor.thickYellow,
              icon: const Icon(
                Icons.light_mode_outlined,
                color: Colors.white,
                size: 35,
              ))));
    } else {
      verseColor[pageWidgetindex][index].value = Colors.red;
      changeOpacity();
      firstHint = true;
    }
  }
}
