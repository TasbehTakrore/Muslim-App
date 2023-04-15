import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../core/localization/changelocal.dart';
import '../core/services/services.dart';
import '../data/model/front_models/verseInformation.dart';

class RecitationScreenController extends GetxController {
  MyServices myServices = Get.put(MyServices());
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
  int? pageWidgetIndexSave;
  int? partIndex;
  int? surahCountSave;
  bool next = false;
  BuildContext? context;
  bool? setBlack = true;
  Rx<IconData> nextReloadIcon = Icons.done.obs;
  List<List<int>> listOfversesID = [];
  List<List<int>> listOfSurahsID = [];

  get nextReload => nextReloadIcon;
  changePageIndex(int pageIndex) {
    service.recitation.setInt("startIndexRecit", pageIndex);
    emptyLists();
    createLists();
  }

  setNextIcon() {
    nextReloadIcon.value = Icons.done;
  }

  setReloadIcon() {
    nextReloadIcon.value = Icons.replay_outlined;
  }

  emptyLists() {
    mistakesCount = 0;
    hintsCount = 0;
    savepageOpacity.clear();
    beginningVerses.clear();
    verseColor.clear();
    listOfversesID.clear();
    listOfSurahsID.clear();
    previousVerseCount = 0;
    index = 0;
    pageWidgetindex = getPageIndex();
    hintColor = AppColor.thickYellow.obs;
    firstHint = true;
    allVersesInformation.clear();
    mistakesList.clear();
    hintsList.clear();
    totalPageCount = 604;
    setNextIcon();
    //indexP = 0;
  }

  createLists() {
    savepageOpacity.addAll(List.generate(604, (_) => []));
    beginningVerses.addAll(List.generate(604, (_) => []));
    verseColor.addAll(List.generate(604, (_) => []));
    listOfversesID.addAll(List.generate(604, (_) => []));
    listOfSurahsID.addAll(List.generate(604, (_) => []));
  }

  bool englishLang() {
    return localeController.myServices.sharedPreferences.getString("lang") ==
            "en"
        ? true
        : false;
  }

  // ignore: non_constant_identifier_names
  int getPageIndex() {
    return myServices.quranPage.getInt("startIndexRecit")! - 1;
  }

  setPageIndex(int i) {
    pageWidgetindex = i;
    index = 0;
    previousVerseCount = 0;
    setNextIcon();
  }

  changeOpacity() {
    previousVerseCount = 0;

    //print(" ${savepageOpacity[pageWidgetindex].length} + $index");
    if (index < savepageOpacity[pageWidgetindex].length) {
      savepageOpacity[pageWidgetindex][index].value = 1.0;
      if (setBlack == true)
        verseColor[pageWidgetindex][index].value = Colors.black;
      index = index + 1;
      if (index == savepageOpacity[pageWidgetindex].length) setReloadIcon();
      setBlack = true;
      for (int i = index; i < savepageOpacity[pageWidgetindex].length; i++) {
        verseColor[pageWidgetindex][i].value =
            Color.fromARGB(255, 242, 242, 242);
        //savepageOpacity[pageWidgetindex][i].value = 0.02;
      }

      hintColor.value = AppColor.thickYellow;
      firstHint = true;
      //print("inside: ${savepageOpacity[pageWidgetindex]}");
      //print(verseColor[pageWidgetindex]);
      //print(savepageOpacity);
    } else if (index == savepageOpacity[pageWidgetindex].length) {
      //print("nooow");
      reStartPage();
    }
    // print(totalPageCount);
  }

  reStartPage() {
    previousVerseCount = 0;

    int index = 0;
    while (index < savepageOpacity[pageWidgetindex].length) {
      savepageOpacity[pageWidgetindex][index].value = 0.2;
      verseColor[pageWidgetindex][index].value = Colors.black;
      index = index + 1;
      //print(savepageOpacity[pageWidgetindex]);
      //print("${savepageOpacity[pageWidgetindex]}");
    }
    setPageIndex(pageWidgetindex);
  }

  goToNextPage() {
    //print(" hiiiiiii $pageWidgetindex  + $totalPageCount");
    // if (pageWidgetindex + 1 == totalPageCount) {
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
                        child: const Center(
                          child: Text(
                            "  bjdskalm",
                            //  "Pages:${getStartPage()} - ${getEndPage()}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
    //}
  }

  setSurahPageData(int pageNumb, int partindex, int pageWidgetIndex,
      BuildContext contex, int surahCount) {
    if (partindex == 0) {
      previousVerseCount = 0;
    } else {
      previousVerseCount += versesCount!;
    }

    surahCountSave = surahCount;
    context = contex;
    indexP = pageNumb;
    partIndex = partindex;
    pageWidgetIndexSave = pageWidgetIndex;
    surahNumb = getPageData(pageNumb)[partindex]["surah"];
    allVersescount = getVerseCount(surahNumb!);
    startVerse = getPageData(pageNumb)[partindex]["start"];
    endVerse = getPageData(pageNumb)[partindex]["end"];
    versesCount = endVerse! - startVerse! + 1;
    surahName = getSurahNameArabic(surahNumb!);
    pageJuzNumber = getJuzNumber(surahNumb!, startVerse!);
    //print("start: $startVerse + end: $endVerse");
    versesList.clear();
    listOfversesID[pageWidgetIndex].clear();
    listOfSurahsID[pageWidgetIndex].clear();
    VerseInformation VInfo;

    for (var i = 0; i < versesCount!; i++) {
      verseWords = getVerse(surahNumb!, startVerse! + i).split(" ");
      savepageOpacity[pageWidgetIndex].add(0.2.obs);
      verseColor[pageWidgetIndex].add(Colors.black.obs);
      //

      listOfversesID[pageWidgetIndex].add(startVerse! + i);
      listOfSurahsID[pageWidgetIndex].add(surahNumb!);
      print(listOfversesID[pageWidgetIndex]);
      print(listOfSurahsID[pageWidgetIndex]);
//
      for (int R = 0; R < verseWords!.length; R++) {
        if (R == 0) beginningVerses[pageWidgetIndex].add(verseWords![0]);
        String D = verseWords![R];
        Rx<Color> N = verseColor[pageWidgetIndex][i + previousVerseCount];
        versesList.add(
          Obx(() => Opacity(
                opacity: savepageOpacity[pageWidgetIndex]
                        [i + previousVerseCount]
                    .value,
                child: Text(
                  D,
                  style: TextStyle(
                    color: N.value,
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
    //print("===> save ${allVersesInformation[pageWidgetIndex][0].verseId}");
  }

  showsHint(BuildContext context) {
    print("seee=> $index");
    //print(beginningVerses[pageWidgetindex].length);
    //print(index);
    if (index >= (beginningVerses[pageWidgetindex].length)) return;
    if (firstHint == true) {
      hintsCount++;
      firstHint = false;
      hint = beginningVerses[pageWidgetindex][index].obs;
      hintColor.value = Colors.red;
      // dddhintsList.add(allVersesInformation[pageWidgetindex][index]);
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
      //hintsList.remove(allVersesInformation[pageWidgetindex][index]);
      mistakesCount++;
      setBlack = false;
      verseColor[pageWidgetindex][index].value = Colors.red;
      // ggggmistakesList.add(allVersesInformation[pageWidgetindex][index]);
      changeOpacity();
      firstHint = true;
      //if (index == savepageOpacity[pageWidgetindex].length) goToNextPage();
    }
  }
}
