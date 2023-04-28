import 'dart:async';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/services/mistake_services.dart';
import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../core/localization/changelocal.dart';
import '../core/services/services.dart';
import '../data/model/backend_to_front_models/mistake_model.dart';
import '../data/model/front_models/verseInformation.dart';

import '../view/widget/recitation/statisticsrecitationcontent.dart';

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
  //MyServices service = Get.put(MyServices());
  int pageWidgetindex = 0;
  List<List<String>> beginningVerses = [];
  List<List<String>> secondeWordOfVerses = [];
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
  List<List<int>> NumberWordsOfVerse = [];
  List<List<int>> listOfSurahsID = [];
  List<Map<String, dynamic>> mistakeModelList = [];
  String userEmail = 'tasbeh.takrore@gmail.com';
  bool secondHint = false;
  Timer? timer;
  bool nextForAutoState = false;
  int seconds = 0;
  int indexTime = 0;
  Rx<bool> visibleBar = false.obs;
  Rx<double>? percent = 0.0.obs;

//

  bool hintEnableFlage = true;

  showBar() {
    visibleBar.value = true;
  }

  hiddenBar() {
    visibleBar.value = false;
  }

  get nextReload => nextReloadIcon;
  changePageIndex(int pageIndex) {
    myServices.recitation.setInt("startIndexRecit", pageIndex);
    emptyLists();
    createLists();
  }

  setNextIcon() {
    nextReloadIcon.value = Icons.done;
    //hintEnableFlage = true;
  }

  setReloadIcon() {
    nextReloadIcon.value = Icons.replay_outlined;
    // hintEnableFlage = false;
    //hintColor.value = Colors.grey;
  }

  emptyLists() {
    mistakesCount = 0;
    hintsCount = 0;
    savepageOpacity.clear();
    beginningVerses.clear();
    secondeWordOfVerses.clear();
    verseColor.clear();
    listOfversesID.clear();
    listOfSurahsID.clear();
    mistakeModelList.clear();
    previousVerseCount = 0;
    index = 0;
    pageWidgetindex = getPageIndex();
    hintColor = AppColor.thickYellow.obs;
    firstHint = true;
    allVersesInformation.clear();
    NumberWordsOfVerse.clear();

    mistakesList.clear();
    hintsList.clear();
    totalPageCount = 604;
    setNextIcon();
    //indexP = 0;
  }

  cancleTimer() {
    if (timer != null) {
      timer!.cancel();
    }
  }

  createLists() {
    savepageOpacity.addAll(List.generate(604, (_) => []));
    beginningVerses.addAll(List.generate(604, (_) => []));
    secondeWordOfVerses.addAll(List.generate(604, (_) => []));
    verseColor.addAll(List.generate(604, (_) => []));
    listOfversesID.addAll(List.generate(604, (_) => []));
    listOfSurahsID.addAll(List.generate(604, (_) => []));
    NumberWordsOfVerse.addAll(List.generate(604, (_) => []));
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
    print("set page index");
    hiddenBar();
    pageWidgetindex = i;
    index = 0;
    previousVerseCount = 0;
    setNextIcon();
    firstHint = true;
    secondHint = false;
    hintColor.value = AppColor.thickYellow;
  }

  changeOpacity(bool fromAutoTimer) {
    print(
        "index: $index + savepageOpacity[pageWidgetindex]: ${savepageOpacity[pageWidgetindex]}");
    previousVerseCount = 0;
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
    } else if (index == savepageOpacity[pageWidgetindex].length) {
      reStartPage();
    }
    if (fromAutoTimer == true) {
      nextForAutoState = false;
    } else {
      nextForAutoState = true;
    }
  }

  reStartPage() {
    previousVerseCount = 0;

    int index = 0;
    while (index < savepageOpacity[pageWidgetindex].length) {
      savepageOpacity[pageWidgetindex][index].value = 0.04;
      verseColor[pageWidgetindex][index].value = Colors.black;
      index = index + 1;
    }
    setPageIndex(pageWidgetindex);
  }

  statisticsAndEnd() {
    MistakeServices.mistakeLogging(mistakeModelList);
    mistakeModelList.clear();
    return showDialog(
        context: context!,
        builder: (BuildContext context) {
          return statisticsRecitationContent();
        });
  }

  setSurahPageData(int pageNumb, int partindex, int pageWidgetIndex,
      BuildContext contex, int surahCount) {
    if (partindex == 0) {
      savepageOpacity[pageWidgetIndex].clear();
      previousVerseCount = 0;
    } else {
      previousVerseCount += versesCount!;
    }
    print("tttttttttttttttttttttttttt + $pageNumb");
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
    versesList.clear();
    //NumberWordsOfVerse[pageWidgetIndex].clear();
    // listOfversesID[pageWidgetIndex].clear();
    //savepageOpacity[pageWidgetIndex].clear();
    // listOfSurahsID[pageWidgetIndex].clear();
    //savepageOpacity[pageWidgetIndex].add(0.2.obs);

    VerseInformation VInfo;

    for (var i = 0; i < versesCount!; i++) {
      verseWords = getVerse(surahNumb!, startVerse! + i).split(" ");
      savepageOpacity[pageWidgetIndex].add(0.2.obs);
      verseColor[pageWidgetIndex].add(Colors.black.obs);
      NumberWordsOfVerse[pageWidgetIndex].add(verseWords!.length);

      //
      listOfversesID[pageWidgetIndex].add(startVerse! + i);
      listOfSurahsID[pageWidgetIndex].add(surahNumb!);

//
      for (int R = 0; R < verseWords!.length; R++) {
        if (R == 0) {
          beginningVerses[pageWidgetIndex].add(verseWords![0]);
          if (R + 1 == verseWords!.length) {
            // no other word.. so add null in second list
            secondeWordOfVerses[pageWidgetIndex].add("");
          }
        } else if (R == 1) {
          secondeWordOfVerses[pageWidgetIndex].add(verseWords![1]);
        }
        String D = verseWords![R];
        Rx<Color> N = verseColor[pageWidgetIndex][i + previousVerseCount];

        print("$pageWidgetIndex  + $i  +  $previousVerseCount  ");
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
    print("versesList: $versesList");

////////
  }

  showsHint(BuildContext context) {
    if (index >= (beginningVerses[pageWidgetindex].length)) return;
    if (firstHint == true && secondHint == false) {
      mistakeModelList.add(MistakeModel(
              userEmail: userEmail,
              mistakeType: 0,
              weight: 25,
              surahId: listOfSurahsID[pageWidgetindex][index],
              ayahId: listOfversesID[pageWidgetindex][index])
          .toJson());
      hintsCount++;
      firstHint = false;
      if (NumberWordsOfVerse[pageWidgetindex][index] > 3) {
        secondHint = true;
      } else {
        hintColor.value = Colors.red;
      }
      hint = beginningVerses[pageWidgetindex][index].obs;
      // dddhintsList.add(allVersesInformation[pageWidgetindex][index]);
      return showTopSnackBar(
          padding: const EdgeInsets.all(90),
          animationDuration: const Duration(milliseconds: 1000),
          displayDuration: const Duration(microseconds: 100),
          Overlay.of(context),
          Obx(() => CustomSnackBar.info(
              //textDirection: TextDirection.rtl,
              textStyle: const TextStyle(
                fontFamily: "Quran",
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
              message: " ${hint.value}",
              backgroundColor: AppColor.thickYellow,
              icon: const Icon(
                Icons.light_mode_outlined,
                color: Colors.white,
                size: 35,
              ))));
    } else if (secondHint == true) {
      mistakeModelList.add(MistakeModel(
              userEmail: userEmail,
              mistakeType: 0,
              weight: 25,
              surahId: listOfSurahsID[pageWidgetindex][index],
              ayahId: listOfversesID[pageWidgetindex][index])
          .toJson());

      hintColor.value = Colors.red;
      secondHint = false;
      hint = secondeWordOfVerses[pageWidgetindex][index].obs;
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
              message: "${hint.value}",
              backgroundColor: AppColor.thickYellow,
              icon: const Icon(
                Icons.light_mode_outlined,
                color: Colors.white,
                size: 35,
              ))));
    } else {
      hintsCount--;
      mistakeModelList.remove(MistakeModel(
              userEmail: userEmail,
              mistakeType: 0,
              weight: 50,
              surahId: listOfSurahsID[pageWidgetindex][index],
              ayahId: listOfversesID[pageWidgetindex][index])
          .toJson());
      mistakeModelList.remove(MistakeModel(
              userEmail: userEmail,
              mistakeType: 0,
              weight: 25,
              surahId: listOfSurahsID[pageWidgetindex][index],
              ayahId: listOfversesID[pageWidgetindex][index])
          .toJson());
      mistakeModelList.add(MistakeModel(
              userEmail: userEmail,
              mistakeType: 1,
              weight: 100,
              surahId: listOfSurahsID[pageWidgetindex][index],
              ayahId: listOfversesID[pageWidgetindex][index])
          .toJson());

      mistakesCount++;
      setBlack = false;
      verseColor[pageWidgetindex][index].value = Colors.red;
      // ggggmistakesList.add(allVersesInformation[pageWidgetindex][index]);
      changeOpacity(false);
      firstHint = true;
      //if (index == savepageOpacity[pageWidgetindex].length) goToNextPage();
    }
  }

  void autoState() {
    int prevSeconds = 0;
    int prevIndexTime = 0;
    seconds = 0;
    indexTime = 0;
    indexTime = NumberWordsOfVerse[pageWidgetindex][index]; // here index =0
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print("الوقت  $seconds , المطلوب: ${indexTime + 2}");

      if (seconds == indexTime + 2) {
        verseColor[pageWidgetindex][index].value = Colors.red;
        setBlack = false;
        mistakeModelList.add(MistakeModel(
                userEmail: userEmail,
                mistakeType: 1,
                weight: 100,
                surahId: listOfSurahsID[pageWidgetindex][index],
                ayahId: listOfversesID[pageWidgetindex][index])
            .toJson());

        mistakesCount++;
        changeOpacity(true);
        prevSeconds = seconds;
        prevIndexTime = seconds;
        if (index < NumberWordsOfVerse[pageWidgetindex].length) {
          print(
              "Inside s:${NumberWordsOfVerse[pageWidgetindex]} index: $index");
          indexTime += NumberWordsOfVerse[pageWidgetindex][index];
        } else {
          hiddenBar();
          timer.cancel();
          setReloadIcon();
          return;
        }
        print("indexTime $indexTime");
        //index++;
      } else if (nextForAutoState == true) {
        print("nextForAutoState $nextForAutoState");
        nextForAutoState = false;
        seconds = indexTime; // jump in the time
        print("seconds after $seconds");
        prevSeconds = seconds;
        prevIndexTime = indexTime;
        if (index < NumberWordsOfVerse[pageWidgetindex].length) {
          print("hiii");
          print(NumberWordsOfVerse[pageWidgetindex].length);
          print(index);
          indexTime += NumberWordsOfVerse[pageWidgetindex][index];
        } else {
          hiddenBar();
          timer.cancel();
          setReloadIcon();
          return;
        }
      } else {
        seconds++;
        percent!.value =
            (seconds - prevSeconds) / (indexTime + 2 - prevIndexTime);
      }
      //if (second > 100) ;
    });
  }
}
