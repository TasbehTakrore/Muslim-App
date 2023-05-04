import 'dart:io';
import 'dart:math';

import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'package:alquramcommunity_frontend/controller/speechRecognition_controller.dart';
import 'package:arabic_tools/arabic_tools.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/juz_data.dart';
import 'package:quran/quran.dart';
import 'package:quran/quran_text.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:convert';
import '../core/constant/color.dart';
import '../core/services/coins_services.dart';
import '../core/services/mistake_services.dart';
import '../core/services/services.dart';
import '../data/model/backend_to_front_models/mistake_model.dart';
import '../view/widget/recitation/statisticsrecitationcontent.dart';
import '../view/widget/trainer/statistictrainercontent.dart';
import 'auth/appbar_controller.dart';

class TrainerScreenController extends GetxController {
  //
  RxString ayahTest = "بسم الله".obs;
  int juzNumber = 0;
  int surahNumb = 0;
  int index = 1;
  int verseCount = 0;
  List<String> ayahList = [];
  List<String> ayahListStandard = [];
  List<String> Words = [];
  List<String> WordsStand = [];
  int randVerseIndex = 0;
  List<Widget> wordsWidgetList = [];
  int testTypeIndex = 0;
  String specificPreviousAyah = "";
  String firstWord = "";
  String endWord = "";
  String displayInBar = "";
  String endPartWord = "";
  String firstPartWord = "";
  String specificPreviousAyahStand = "";
  String specificNextAyahStand = "";
  String specificNextAyah = "";
  List pageData = [];
  List<int> verseIndex = [];
  List<int> surahIndex = [];
  int surahIDToSave = 0;
  int ayahIDToSave = 0;
  String remainingWords = "";
  String specificAyah = "";
  String specificAyahStand = "";
  var random = Random();
  Rx<int> counter = 0.obs;
  bool juzFlag = false;
  int pageNumber = 0;
  List<Map<String, dynamic>> mistakeModelList = [];
  String? userEmail;
  MyServices myServices = Get.put(MyServices());
  APPBarController appBarController = Get.put(APPBarController());

  @override
  void onInit() {
    super.onInit();
    userEmail = myServices.sharedPreferences.getString("user_email");
    _speech = SpeechToText();
    initSpeechRecognition();
  }

  // var min = 1;
  // var max = 100;
  // var randomNumber = min + random.nextInt(max - min);
  int? rand;
  int getRandom(int min, int max) {
    rand = min + random.nextInt(max - min);
    print(rand);
    return rand!;
    // min =0
  }

  letsSurahTest(int surahIndex) {
    mistakeModelList.clear();
    wordsWidgetList.clear();
    counter.value = 0;
    surahNumb = surahIndex;
    print(surahNumb);
    verseCount = getVerseCount(surahNumb);
    prepareTestDataForSurah();
    testType();
    //testWithhideTheFirstWord();
  }

  letsJuzTest(int juzIndex) {
    mistakeModelList.clear();
    juzNumber = juzIndex;
    print(juzNumber);
    prepareTestDataForJuz();
    //service.recitation.setInt("surahTrainerIndex", pageIndex);
  }

  letsPageTest(int pageIndex) {
    mistakeModelList.clear();
    pageNumber = pageIndex;
    print(pageIndex);
    prepareTestDataForPage();
    //service.recitation.setInt("surahTrainerIndex", pageIndex);
  }

  int type = 0;
  void testType() {
    testTypeIndex = getRandom(0, 6);
    if (testTypeIndex == 0) {
      testWithhideTheFirstWord();
      startListening(conteXt!);
      type = 0;
    } else if (testTypeIndex == 1) {
      testWithhideTheEndWord();
      startListening(conteXt!);
      type = 1;
    } else if (testTypeIndex == 2) {
      testWithhideThePartFirstWord();
      startListening(conteXt!);
      type = 2;
    } else if (testTypeIndex == 3) {
      testWithhideThePartEndWord();
      startListening(conteXt!);
      type = 3;
    } else if (testTypeIndex == 4) {
      testWithPreviousAyah();
      startListening(conteXt!);
      type = 4;
    } else if (testTypeIndex == 5) {
      testWithNextAyah();
      startListening(conteXt!);
      type = 5;
    }
  }

  prepareTestDataForSurah() {
    juzFlag = false;

    ayahList.clear();
    wordsWidgetList.clear();
    ayahListStandard.clear();
    verseCount = getVerseCount(surahNumb);
    print("verseCount $verseCount");
    for (int i = 0; i < verseCount; i++) {
      ayahList.add(getVerse(surahNumb, i + 1, verseEndSymbol: false));
      ayahListStandard
          .add(getVerseStandard(surahNumb, i + 1, verseEndSymbol: false));
    }
    print(ayahList);
    // print(searchWords(["سَوَآءٌ"]));
  }

  prepareTestDataForPage() {
    juzFlag = true;
    ayahList.clear();
    verseIndex.clear();
    surahIndex.clear();
    wordsWidgetList.clear();
    ayahListStandard.clear();

    ayahList.addAll(getVersesTextByPage(pageNumber));
    ayahListStandard.addAll(getVersesTextByPageStanderd(pageNumber));
    pageData = getPageData(pageNumber);

    pageData.forEach((element) {
      for (int s = element['start']; s <= element['end']; s++) {
        verseIndex.add(s);
        surahIndex.add(element['surah']);
        print(s);
      }
    });

    verseCount = ayahList.length;
    testType();
    // print(searchWords(["سَوَآءٌ"]));
  }

  prepareTestDataForJuz() {
    juzFlag = true;
    ayahList.clear();
    verseIndex.clear();
    surahIndex.clear();
    wordsWidgetList.clear();
    ayahListStandard.clear();
    print(quranJuzList[juzNumber - 1]);
    for (int i = quranJuzList[juzNumber - 1]['start']!;
        i <= quranJuzList[juzNumber - 1]['end']!;
        i++) {
      print("Page%%%: $i");
      pageData = getPageData(i);
      print("pageData: $pageData");
      ayahList.addAll(getVersesTextByPage(i));
      ayahListStandard.addAll(getVersesTextByPageStanderd(i));

      pageData.forEach((element) {
        for (int s = element['start']; s <= element['end']; s++) {
          verseIndex.add(s);
          surahIndex.add(element['surah']);
          print(s);
        }
      });
    }
    verseCount = ayahList.length;
    testType();
    // print(searchWords(["سَوَآءٌ"]));
  }

  testWithhideTheFirstWord() {
    wordsWidgetList.clear();
    counter.value++;
    randVerseIndex = getRandom(0, verseCount);
    specificAyah = ayahList[randVerseIndex];
    specificAyahStand = ayahListStandard[randVerseIndex];

    Words = specificAyah.split(' ');
    WordsStand = specificAyahStand.split(' ');
    firstWord = WordsStand[0];
    displayInBar = Words[0];
    remainingWords = "...... ${Words.sublist(1).join(' ')}";
    //ayahTest.value = "...... " + remainingWords;
    setReferenceText(firstWord);

    wordsWidgetList.addAll(remainingWords.split(' ').map((D) => Text(
          D,
          style: TextStyle(fontFamily: "Quran", fontSize: 22),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        )));
    wordsWidgetList.add(Text(
      getVerseEndSymbol(
          juzFlag == true ? verseIndex[randVerseIndex] : randVerseIndex + 1),
      style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 41, 119, 97),
          fontWeight: FontWeight.w700),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ));

    print(wordsWidgetList);
    //hideTheFirstWord();
  }

  testWithhideTheEndWord() {
    wordsWidgetList.clear();
    counter.value++;
    randVerseIndex = getRandom(0, verseCount);
    specificAyah = ayahList[randVerseIndex];
    specificAyahStand = ayahListStandard[randVerseIndex];

    Words = specificAyah.split(' ');
    WordsStand = specificAyahStand.split(' ');
    endWord = WordsStand[Words.length - 1];
    displayInBar = Words[Words.length - 1];
    remainingWords = "${Words.sublist(0, Words.length - 1).join(' ')} .....";
    //ayahTest.value = "...... " + remainingWords;
    print("endWord: $endWord");
    setReferenceText(endWord);

    wordsWidgetList.addAll(remainingWords.split(' ').map((D) => Text(
          D,
          style: TextStyle(fontFamily: "Quran", fontSize: 22),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        )));
    wordsWidgetList.add(Text(
      getVerseEndSymbol(
          juzFlag == true ? verseIndex[randVerseIndex] : randVerseIndex + 1),
      style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 41, 119, 97),
          fontWeight: FontWeight.w700),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ));

    print(wordsWidgetList);
    //hideTheFirstWord();
  }

  setSurahIDAndAyahID() {
    surahIDToSave = juzFlag == true ? surahIndex[randVerseIndex] : surahNumb;
    ayahIDToSave =
        juzFlag == true ? verseIndex[randVerseIndex] : randVerseIndex + 1;

    if (type == 4) ayahIDToSave--;
    if (type == 5) ayahIDToSave++;
  }

  void falseAnswer() {
    setSurahIDAndAyahID();
    print("false...");
    mistakeModelList.add(MistakeModel(
            userEmail: userEmail,
            mistakeType: 0,
            weight: 10,
            surahId: surahIDToSave,
            ayahId: ayahIDToSave)
        .toJson());
    print(mistakeModelList);
    testType();
    print("false Answer ++++++++++%%%%%%%%%%%%++++++++++++");

    testType();
  }

  void trueAnswer() {
    setSurahIDAndAyahID();
    appBarController.addCoins();
    print("after match inside true answer");
    mistakeModelList.add(MistakeModel(
            userEmail: userEmail,
            mistakeType: 0,
            weight: -10,
            surahId: surahIDToSave,
            ayahId: ayahIDToSave)
        .toJson());
    print(mistakeModelList);
    testType();
    print("true Answer ++++++++++**++++++++++++");
  }

  // prepareTestDataForJuz() {
  //   print("prepareTestDataForJuz");
  // }

// work here
  testWithhideThePartEndWord() {
    wordsWidgetList.clear();
    counter.value++;
    randVerseIndex = getRandom(0, verseCount);
    specificAyah = ayahList[randVerseIndex];
    specificAyahStand = ayahListStandard[randVerseIndex];

    Words = specificAyah.split(' ');
    WordsStand = specificAyahStand.split(' ');
    endPartWord =
        WordsStand.sublist((Words.length ~/ 2), Words.length).join(' ');
    displayInBar = Words.sublist((Words.length ~/ 2), Words.length).join(' ');
    remainingWords =
        "${Words.sublist(0, Words.length ~/ 2).join(' ')} ..................";
    //ayahTest.value = "...... " + remainingWords;
    print("endPartWord: $endPartWord");
    setReferenceText(endPartWord);

    wordsWidgetList.addAll(remainingWords.split(' ').map((D) => Text(
          D,
          style: TextStyle(fontFamily: "Quran", fontSize: 22),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        )));
    wordsWidgetList.add(Text(
      getVerseEndSymbol(
          juzFlag == true ? verseIndex[randVerseIndex] : randVerseIndex + 1),
      style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 41, 119, 97),
          fontWeight: FontWeight.w700),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ));

    print(wordsWidgetList);
    //hideTheFirstWord();
  }

  testWithhideThePartFirstWord() {
    wordsWidgetList.clear();
    counter.value++;
    randVerseIndex = getRandom(0, verseCount);
    specificAyah = ayahList[randVerseIndex];
    specificAyahStand = ayahListStandard[randVerseIndex];

    Words = specificAyah.split(' ');
    WordsStand = specificAyahStand.split(' ');
    firstPartWord = WordsStand.sublist(0, (Words.length ~/ 2)).join(' ');
    displayInBar = Words.sublist(0, (Words.length ~/ 2)).join(' ');
    remainingWords =
        " .................. ${Words.sublist(Words.length ~/ 2, Words.length).join(' ')}";
    //ayahTest.value = "...... " + remainingWords;
    print("firstPartWord: $firstPartWord");
    setReferenceText(firstPartWord);

    wordsWidgetList.addAll(remainingWords.split(' ').map((D) => Text(
          D,
          style: TextStyle(fontFamily: "Quran", fontSize: 22),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        )));
    wordsWidgetList.add(Text(
      getVerseEndSymbol(
          juzFlag == true ? verseIndex[randVerseIndex] : randVerseIndex + 1),
      style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 41, 119, 97),
          fontWeight: FontWeight.w700),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ));

    print(wordsWidgetList);
    //hideTheFirstWord();
  }

  testWithPreviousAyah() {
    wordsWidgetList.clear();
    counter.value++;
    randVerseIndex = getRandom(1, verseCount);
    specificAyah = ayahList[randVerseIndex];
    specificPreviousAyahStand = ayahListStandard[randVerseIndex - 1];
    specificPreviousAyah = ayahList[randVerseIndex - 1];
    displayInBar = specificPreviousAyah;
    print("specificPreviousAyahStand: $specificPreviousAyahStand");
    setReferenceText(specificPreviousAyahStand);
    wordsWidgetList.add(const Text(
      "...............",
      style: TextStyle(
          fontFamily: "Quran",
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w700),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ));
    wordsWidgetList.add(Text(
      getVerseEndSymbol(
          juzFlag == true ? verseIndex[randVerseIndex - 1] : randVerseIndex),
      style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 41, 119, 97),
          fontWeight: FontWeight.w700),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ));
    wordsWidgetList.addAll(specificAyah.split(' ').map((D) => Text(
          D,
          style: TextStyle(fontFamily: "Quran", fontSize: 22),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        )));
    wordsWidgetList.add(Text(
      getVerseEndSymbol(
          juzFlag == true ? verseIndex[randVerseIndex] : randVerseIndex + 1),
      style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 41, 119, 97),
          fontWeight: FontWeight.w700),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ));

    print(wordsWidgetList);
    //hideTheFirstWord();
  }

  testWithNextAyah() {
    wordsWidgetList.clear();
    counter.value++;
    randVerseIndex = getRandom(0, verseCount - 1);
    specificAyah = ayahList[randVerseIndex];
    specificNextAyahStand = ayahListStandard[randVerseIndex + 1];
    specificNextAyah = ayahList[randVerseIndex + 1];
    displayInBar = specificNextAyah;
    print("specificNextAyahStand: $specificNextAyahStand");
    setReferenceText(specificNextAyahStand);

    wordsWidgetList.addAll(specificAyah.split(' ').map((D) => Text(
          D,
          style: TextStyle(fontFamily: "Quran", fontSize: 22),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        )));
    print("verseIndex********************* $verseIndex");
    wordsWidgetList.add(Text(
      getVerseEndSymbol(
          juzFlag == true ? verseIndex[randVerseIndex] : randVerseIndex + 1),
      style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 41, 119, 97),
          fontWeight: FontWeight.w700),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ));
    wordsWidgetList.add(Text(
      "...............",
      style: const TextStyle(
          fontFamily: "Quran",
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w700),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ));
    wordsWidgetList.add(Text(
      getVerseEndSymbol(juzFlag == true
          ? verseIndex[randVerseIndex + 1]
          : randVerseIndex + 2),
      style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 41, 119, 97),
          fontWeight: FontWeight.w700),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ));
    print(wordsWidgetList);
    //hideTheFirstWord();
  }

//   Future<void> Test() async {
//     print("start");

//     for (int i = 0; i < 6235; i++) {
//       quranText[i]['content'] = mainQuran[i]['content'];
//       //print(quranText[i]);
//     }
//     final directory = await Directory.systemTemp.createTemp('my_temp_dir');
//     final filePath = '${directory.path}/example.txt';
//     final file = File(filePath);
//     await file.writeAsString('Hello, world!');
//     print(await file.readAsString());

// // Open the file
//     Process.run('open', [filePath]);

// //  final file = File('example.txt');
// //   file.writeAsString('Hello, world!');

//     //    stdout.encoding = Encoding.getByName('utf-8')!;
//     // stdout.lineMode = LineMode.terminal;
//     // stdout.terminalColumns = 200;
//     // final filename = 'myFile.txt';
//     // final myText = 'Hello, World!';

//     // final file = File(filename);
//     // file.writeAsString(myText);
//     // File('myList.text').writeAsString(quranText.join('\n'));

//     print('List printed to file successfully!');
//     print("end");
//   }

  void showFirstWord(BuildContext context) {
    return showTopSnackBar(
        padding:
            const EdgeInsets.only(top: 50, bottom: 20, right: 15, left: 15),
        animationDuration: const Duration(milliseconds: 1000),
        displayDuration: const Duration(microseconds: 100),
        Overlay.of(context),
        CustomSnackBar.info(
            //textDirection: TextDirection.rtl,
            textStyle: const TextStyle(
              fontFamily: "Quran",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
            message: " ${displayInBar}",
            backgroundColor: AppColor.thickYellow,
            icon: const Icon(
              Icons.light_mode_outlined,
              color: Colors.white,
              size: 35,
            )));
  }

  final _rangeValues = const RangeValues(1, 604).obs;

  set rangeValues(RangeValues value) => _rangeValues.value = value;
  RangeValues get rangeValues => _rangeValues.value;

  int get startPageIndex => rangeValues.start.round();
  int get endPageIndex => rangeValues.end.round();

  void changeIndex(int v) {
    index = v;
    update();
  }

  int getIndex() {
    return index;
  }

  final List<Map<String, int>> quranJuzList = [
    {"start": 1, "end": 21},
    {"start": 22, "end": 41},
    {"start": 42, "end": 61},
    {"start": 62, "end": 81},
    {"start": 82, "end": 101},
    {"start": 102, "end": 121},
    {"start": 122, "end": 141},
    {"start": 142, "end": 161},
    {"start": 162, "end": 181},
    {"start": 182, "end": 201},
    {"start": 202, "end": 221},
    {"start": 222, "end": 241},
    {"start": 242, "end": 261},
    {"start": 262, "end": 281},
    {"start": 282, "end": 301},
    {"start": 302, "end": 321},
    {"start": 322, "end": 341},
    {"start": 342, "end": 361},
    {"start": 362, "end": 381},
    {"start": 382, "end": 401},
    {"start": 402, "end": 421},
    {"start": 422, "end": 441},
    {"start": 442, "end": 461},
    {"start": 462, "end": 481},
    {"start": 482, "end": 501},
    {"start": 502, "end": 521},
    {"start": 522, "end": 541},
    {"start": 542, "end": 561},
    {"start": 562, "end": 581},
    {"start": 582, "end": 604},
  ];

  late SpeechToText _speech;
  RxBool _isAvailable = false.obs;
  RxBool _isListening = false.obs;
  RxString text = "".obs;
  String _referenceText = "";
  Rx<IconData> micIcon = Icons.mic_off.obs;
  BuildContext? conteXt;
  void setOpenMiceIcon() {
    micIcon.value = Icons.mic_none;
    print("Inside");
  }

  void setCloseMiceIcon() {
    micIcon.value = Icons.mic_off;
    print("Close");
  }

  // @override
  // void onInit() {
  //   super.onInit();

  // }

  void setReferenceText(String textt) {
    text.value = "";
    _referenceText = textt.replaceAll('إ', 'ا');
    _referenceText = _referenceText.replaceAll('آ', 'ا');
    _referenceText = _referenceText.replaceAll('أ', 'ا');
    _referenceText = _referenceText.replaceAll('ة', 'ه');
    print(" _referenceText ${_referenceText}");
  }

  void initSpeechRecognition() async {
    _isAvailable.value = await _speech.initialize();
    _speech.errorListener = (SpeechRecognitionError error) {
      setCloseMiceIcon();
      print("sss");
      print("Error555: ${error.errorMsg}");
    };
    _speech.statusListener = (String status) {
      if (status == "listening") {
        _isListening.value = true;
      } else if (status == "notListening") {
        _isListening.value = false;
        setCloseMiceIcon();
      }
    };
  }

//var selectedLocale = Locale('ar', 'AE');
  bool matchFlag = false;
  void startListening(BuildContext context) {
    setOpenMiceIcon();

    matchFlag = false;
    conteXt = context;
    text.value = "";

    if (_isAvailable.value && !_isListening.value) {
      _speech.listen(
        localeId: 'ar',
        partialResults: true, // تمكين النتائج الجزئية
        listenFor: const Duration(seconds: 50), // تحديد مدة الاستماع

        onResult: (result) {
          text.value = result.recognizedWords;
          print(text.value);
          setOpenMiceIcon();

          if (text.value == _referenceText) {
            print("Match found!");

            correctDialog();
            trueAnswer();
            matchFlag = true;
          } else {
            if (_isListening.value == false) {
              print("nooo");
              setCloseMiceIcon();
              matchFlag = false;
            }
          }
        },
      );
    }
  }

  correctDialog() {
    showDialog(
        context: conteXt!,
        builder: (context) {
          return Icon(
            Icons.check_circle,
            size: 200,
            color: Color.fromARGB(255, 62, 171, 66),
          );
        });
    setCloseMiceIcon();
  }

  void stopListening() {
    if (_isListening.value) {
      _speech.stop();
      _isListening.value = false;
      text.value = "";
    }
  }

  statisticsAndEnd() {
    MistakeServices.mistakeLogging(mistakeModelList);
    mistakeModelList.clear();
    CoinsServices.addCoins(appBarController.coinsCount.value);
    return showDialog(
        context: conteXt!,
        builder: (BuildContext context) {
          return statisticsTrainerContent();
        });
    //  Get.toNamed(AppRoute.home);
  }
}
