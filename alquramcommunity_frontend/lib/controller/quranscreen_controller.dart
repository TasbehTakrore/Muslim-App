import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/quranconst.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';

import '../core/localization/changelocal.dart';
import '../core/services/mistake_services.dart';
import '../core/services/services.dart';
import '../data/model/backend_to_front_models/mistake_model.dart';

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

  @override
  void onInit() {
    userEmail = myServices.sharedPreferences.getString("user_email");
    // TODO: implement onInit
    print(mistakesList);
    super.onInit();
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
  }

  changeFontColorToBlack() {
    QuranConstant.fontColor.value = Colors.black;
  }

  changePageIndexAndSurahName(int pageIndex) {
    myServices.quranPage.setInt("lastPageIndex", pageIndex);
    pageindex = pageIndex;
    myServices.quranPage.setString(
        "lastSurahName", getSurahName(getPageData(pageIndex + 1)[0]["surah"]));
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

  bool anyPageOpend() {
    if (myServices.quranPage.getInt("lastPageIndex") == null) return false;
    return true;
  }

  RxString getLastOpenedEng() {
    int? index;
    if (anyPageOpend() == true) {
      index = myServices.quranPage.getInt("lastPageIndex");
      print(myServices.quranPage.getInt("lastPageIndex"));
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
      versesList.addAll(
          getVerse(surahNumb!, startVerse! + i, verseEndSymbol: false)
              .split(" ")
              .map(
                (D) => Text(D,
                    style: TextStyle(
                      color:
                          D.replaceAll(RegExp('[^\u0621-\u064A ]'), '') == "لله"
                              ? Colors.red
                              : QuranConstant.fontColor.value,
                      fontFamily: "Quran",
                      fontSize: QuranConstant.fontsize.value,
                      backgroundColor: mistakesList.any((element) =>
                              element.surahId == surahNumb &&
                              element.ayahId == startVerse! + i)
                          ? AppColor.lightYellow
                          : Color.fromARGB(0, 255, 255, 255),
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
}
