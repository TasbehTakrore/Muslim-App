import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/quranconst.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';

import '../core/localization/changelocal.dart';
import '../core/services/mistake_services.dart';
import '../core/services/services.dart';
import '../data/model/backend_to_front_models/mistake_model.dart';
import '../view/widget/Quran/ayahDetaileDialog.dart';
import '../view/widget/Quran/tafser.dart';

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
  int? pageindex;
  int? allVersescount;
  int index = 1;
  List<MistakeModel> mistakesList = [];
  String? userEmail;
  BuildContext? context;
  bool showFloating = false;

  Map<dynamic, dynamic> verseSearch = {'result': []};
  // List<Icon> Icons = [ Icon(Icons.check),
  // ];
  Rx<bool> black = false.obs;
  Rx<bool> darkYallow = false.obs;
  Rx<bool> lightYallow = true.obs;
  Rx<bool> white = false.obs;
  PageController? pageController;

  @override
  void onInit() {
    userEmail = myServices.sharedPreferences.getString("user_email");
    // TODO: implement onInit
    print(mistakesList);
    super.onInit();
  }

  void goToDefult() {
    QuranConstant.backgroundColor.value = QuranConstant.backgroundColors[1];
    QuranConstant.fontsize.value = 22.0;
    black.value = false;
    darkYallow.value = false;
    lightYallow.value = true;
    white.value = false;
    QuranConstant.showMistake.value = true;
    changeFontColorToBlack();
    update();
  }

  goToPage(int i) {
    pageController!.animateToPage(
      i - 1,
      duration: const Duration(milliseconds: 1), // المدة المطلوبة للانتقال
      curve: Curves.ease,
    );
    Get.back();
  }

  getMistakes() async {
    mistakesList.clear();
    mistakesList = await MistakeServices.getMistakes(userEmail!);
    print(mistakesList);
  }

  changeIndex(int i) {
    index = i;
    update();
  }

  getIndex() {
    return index;
  }

  changeBackground(int index) {
    QuranConstant.backgroundColor.value = QuranConstant.backgroundColors[index];
    update();
  }

  changeFontSize(double v) {
    QuranConstant.fontsize.value = v.round().toDouble();
    update();
  }

  changeFontColorToWhite() {
    QuranConstant.fontColor.value = Color.fromARGB(255, 255, 255, 255);
    QuranConstant.symbolColor.value = AppColor.secondaryColor;
  }

  changeFontColorToBlack() {
    QuranConstant.fontColor.value = Colors.black;
    QuranConstant.symbolColor.value = Color.fromARGB(255, 41, 119, 97);
  }

  changePageIndexAndSurahName(int pageIndex) {
    myServices.quranPage.setInt("lastPageIndex", pageIndex);
    pageindex = pageIndex;
    myServices.quranPage.setString("lastSurahName",
        getSurahNameArabic(getPageData(pageIndex + 1)[0]["surah"]));
  }

  updatee() {
    update();
  }

  final LocaleController localeController = Get.put(LocaleController());

  bool englishLang() {
    return localeController.myServices.sharedPreferences.getString("lang") ==
            "en"
        ? true
        : false;
  }

  // ignore: non_constant_identifier_names
  int getPageIndex() {
    return myServices.quranPage.getInt("lastPageIndex")!;
  }

  void setPageIndex(int i) {
    myServices.quranPage.setInt("lastPageIndex", i);
  }

  bool anyPageOpend() {
    if (myServices.quranPage.getInt("lastPageIndex") == null) return false;
    return true;
  }

  AudioPlayer audioPlayer = AudioPlayer();

  void playAudioBySurah(int surahNumber) async {
    String audioURL = getAudioURLBySurah(surahNumber);
    print("audioURL: $audioURL");
    final player = AudioPlayer();
    await player.play(UrlSource(audioURL)); // if (result == 1) {
    //   // Success
    //   print('Audio played successfully');
    // } else {
    //   // Failed to play the audio
    //   print('Error playing audio');
    // }
  }

  RxString getLastOpenedEng() {
    int? index;
    if (anyPageOpend() == true) {
      index = myServices.quranPage.getInt("lastPageIndex");
      print(myServices.quranPage.getInt("lastPageIndex"));
      print({
        ArabicNumbers().convert(myServices.quranPage.getString("lastSurahName"))
      });
      //update();
      lastPageAndName =
          "${myServices.quranPage.getString("lastSurahName")} - صفحة ${ArabicNumbers().convert(index! + 1)}"
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
      QuranConstant.showMistake.value == true
          ? versesList.addAll(
              getVerse(surahNumb!, startVerse! + i, verseEndSymbol: false)
                  .split(" ")
                  .map(
                    (D) => Text(D,
                        style: TextStyle(
                            color:
                                D.replaceAll(RegExp('[^\u0621-\u064A ]'), '') ==
                                        "لله"
                                    ? Colors.red
                                    : QuranConstant.fontColor.value,
                            fontFamily: "Quran",
                            fontSize: QuranConstant.fontsize.value,
                            backgroundColor: mistakesList.any((element) =>
                                    (element.surahId == surahNumb &&
                                        element.ayahId == startVerse! + i))
                                ? AppColor.lightYellow
                                : Color.fromARGB(0, 255, 255, 255))),
                  ))
          : versesList.addAll(getVerse(surahNumb!, startVerse! + i,
                  verseEndSymbol: false)
              .split(" ")
              .map(
                (D) => Text(D,
                    style: TextStyle(
                        color: D.replaceAll(RegExp('[^\u0621-\u064A ]'), '') ==
                                "لله"
                            ? Colors.red
                            : QuranConstant.fontColor.value,
                        fontFamily: "Quran",
                        fontSize: QuranConstant.fontsize.value,
                        backgroundColor: QuranConstant.showMistake.value == true
                            ? mistakesList.any((element) =>
                                    (element.surahId == surahNumb &&
                                        element.ayahId == startVerse! + i))
                                ? AppColor.lightYellow
                                : Color.fromARGB(0, 255, 255, 255)
                            : Color.fromARGB(0, 255, 255, 255))),
              ));
      versesList.add(InkWell(
        onTap: () {
          showDialog(
              context: context!,
              builder: (context) {
                print((tafser[0][(startVerse! + i).toString()]
                    as Map<String, Object>)["verse"]);
                return AyahDetailsDialog(
                    surahNumb: surahNumb!, verseNumb: startVerse! + i);
              });
        },
        child: Text(
          // key: UniqueKey(),
          getVerseEndSymbol(startVerse! + i),
          style: TextStyle(
              fontSize: 20,
              color: QuranConstant.symbolColor.value,
              fontWeight: FontWeight.w700),
        ),
      ));
    }
  }

  getVerses() {
    // for (var i = 0; i < 10; i++) {
    //   childs.add(new Text("hiii"));
    // }
  }
  void setContext(BuildContext conteXt) {
    context = conteXt;
  }
}
