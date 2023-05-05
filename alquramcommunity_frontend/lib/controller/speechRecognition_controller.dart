import 'dart:ui';
import 'package:alquramcommunity_frontend/controller/trainerScreen_controller.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechRecognitionController extends GetxController {
  TrainerScreenController trainerScreenController =
      Get.find<TrainerScreenController>();
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

  @override
  void onInit() {
    super.onInit();
    _speech = SpeechToText();
    initSpeechRecognition();
  }

  void setReferenceText(String textt) {
    text.value = "";
    _referenceText = textt.replaceAll('إ', 'ا');
    _referenceText = textt.replaceAll('آ', 'ا');
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
        listenFor: const Duration(seconds: 20), // تحديد مدة الاستماع

        onResult: (result) {
          text.value = result.recognizedWords;
          print(text.value);
          setOpenMiceIcon();

          if (text.value == _referenceText) {
            print("Match found!");

            correctDialog();
            trainerScreenController.trueAnswer();
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
}
