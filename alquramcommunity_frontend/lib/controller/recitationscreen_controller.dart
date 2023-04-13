import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/core/services/services.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../core/localization/changelocal.dart';
import '../data/model/front_models/verseInformation.dart';

class RecitationScreenController extends GetxController {
  final PageController pageController = Get.put(PageController());

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
  int indexP = 0;
  MyServices service = Get.put(MyServices());
  int pageWidgetindex = 0;
  List<List<String>> beginningVerses = [];
  List<String>? verseWords;
  int previousVerseCount = 0;
  List<List<RxDouble>> savepageOpacity = [];
  RxString hint = " ".obs;
  Rx<Color> hintColor = AppColor.thickYellow.obs;
  List<List<Rx<Color>>> verseColor = [];
  int totalPageCount = 0;
  List<List<VerseInformation>> allVersesInformation = [];
  bool firstHint = true;
  final LocaleController localeController = Get.put(LocaleController());
  List<VerseInformation> mistakesList = [];
  List<VerseInformation> hintsList = [];
  int hintsCount = 0;
  int mistakesCount = 0;

  bool next = false;
  BuildContext? context;
  // RecitationScreenController.withoutContext();

  // RecitationScreenController(BuildContext this.context);

  bool englishLang() {
    return localeController.myServices.sharedPreferences.getString("lang") ==
            "en"
        ? true
        : false;
  }

  emptyLists() {
    mistakesCount = 0;
    hintsCount = 0;
    savepageOpacity.clear();
    beginningVerses.clear();
    verseColor.clear();
    previousVerseCount = 0;
    index = 0;
    pageWidgetindex = 0;
    hintColor = AppColor.thickYellow.obs;
    firstHint = true;
    allVersesInformation.clear();
    mistakesList.clear();
    hintsList.clear();
    totalPageCount = 0;
    indexP = 0;
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
      print("inside: ${savepageOpacity[pageWidgetindex].length}");
      print(savepageOpacity);
      // } else {
    }
    if (index == savepageOpacity[pageWidgetindex].length) {
      next = true;
      goToNextPage();
    }
    print(totalPageCount);
  }

  goToNextPage() {
    if (pageWidgetindex + 1 == totalPageCount) {
      return showDialog(
          context: context!,
          builder: (BuildContext context) {
            return AlertDialog(
              //backgroundColor: Colors.white.withOpacity(0.1),
              contentPadding: EdgeInsets.all(0),
              iconPadding: EdgeInsets.all(0),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              content: Container(
                  height: 400,
                  width: 300,
                  child: ListView(
                    children: [
                      Positioned(
                        top: 0.01,
                        child: Container(
                          color: AppColor.primaryColor,
                          height: 50,
                          child: Center(
                            child: Text(
                              "Pages:${getStartPage()} - ${getEndPage()}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Text("Total hints: $hintsCount",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center),
                      // Positioned(
                      //   top: 0,
                      //   child: Container(
                      //     width: 500,
                      //     height: 300,
                      //     child: ListView.builder(
                      //         physics: NeverScrollableScrollPhysics(),
                      //         itemCount: hintsCount,
                      //         itemBuilder: ((context, index) => Text(
                      //             "${hintsList[index].surahName}: Verse ${hintsList[index].verseId}}"))),
                      //   ),
                      // ),
                      const Divider(
                        height: 10,
                      ),
                      Text("Total mistakes: $mistakesCount",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center),
                    ],
                  )),
            );
          });
    }
    // next = false;

    // else if (pageWidgetindex + 1 < totalPageCount) {
    //   //else {
    //   pageController.nextPage(
    //       duration: const Duration(milliseconds: 800), curve: Curves.easeIn);
    // }
    //   // print("${pageWidgetindex + 1} ********** $totalPageCount");
    // }
  }

  int getTotalPageCount() {
    totalPageCount = service.recitation.getInt("endPage")! -
        service.recitation.getInt("startPage")! +
        1;
    print("The totel: $totalPageCount");
    return totalPageCount;
  }

  int getStartPage() {
    return service.recitation.getInt("startPage")!;
  }

  int getEndPage() {
    return service.recitation.getInt("endPage")!;
  }

  setSurahPageData(int pageNumb, int partindex, int pageWidgetIndex, contex) {
    if (partindex == 0) {
      previousVerseCount = 0;
    } else {
      previousVerseCount += versesCount!;
    }
    context = contex;
    indexP = pageNumb;
    surahNumb = getPageData(pageNumb)[partindex]["surah"];
    allVersescount = getVerseCount(surahNumb!);
    startVerse = getPageData(pageNumb)[partindex]["start"];
    endVerse = getPageData(pageNumb)[partindex]["end"];
    versesCount = endVerse! - startVerse! + 1;
    surahName = getSurahNameArabic(surahNumb!);
    pageJuzNumber = getJuzNumber(surahNumb!, startVerse!);
    print("start: $startVerse + end: $endVerse");
    versesList.clear();

    savepageOpacity.add([]);
    beginningVerses.add([]);
    verseColor.add([]);
    allVersesInformation.add([]);

    for (var i = 0; i < versesCount!; i++) {
      verseWords = getVerse(surahNumb!, startVerse! + i).split(" ");
      savepageOpacity[pageWidgetIndex].add(0.02.obs);
      verseColor[pageWidgetIndex].add(Colors.black.obs);
      allVersesInformation[pageWidgetIndex].add(VerseInformation(
          verseId: startVerse! + i, surahID: surahNumb, surahName: surahName));
      for (int R = 0; R < verseWords!.length; R++) {
        if (R == 0) beginningVerses[pageWidgetIndex].add(verseWords![0]);
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
////////
    print("===> save ${allVersesInformation}");
  }

  showsHint(BuildContext context) {
    print("seee=>");
    print(beginningVerses[pageWidgetindex].length);
    print(index);
    if (index >= (beginningVerses[pageWidgetindex].length)) return;
    if (firstHint) {
      hintsCount++;
      firstHint = false;
      hint = beginningVerses[pageWidgetindex][index].obs;
      hintColor.value = Colors.red;
      hintsList.add(allVersesInformation[pageWidgetindex][index]);
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
      hintsCount--;
      hintsList.remove(allVersesInformation[pageWidgetindex][index]);
      mistakesCount++;
      verseColor[pageWidgetindex][index].value = Colors.red;
      mistakesList.add(allVersesInformation[pageWidgetindex][index]);
      changeOpacity();
      firstHint = true;
      //if (index == savepageOpacity[pageWidgetindex].length) goToNextPage();
    }
  }
}
