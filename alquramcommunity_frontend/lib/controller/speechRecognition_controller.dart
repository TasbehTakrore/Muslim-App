import 'dart:ui';

import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechRecognitionController extends GetxController {
  late SpeechToText _speech;
  RxBool _isAvailable = false.obs;
  RxBool _isListening = false.obs;
  RxString text = "".obs;
  String _referenceText = "مرحبا كيف حالك";

  @override
  void onInit() {
    super.onInit();
    _speech = SpeechToText();
    initSpeechRecognition();
  }

  void initSpeechRecognition() async {
    _isAvailable.value = await _speech.initialize();
    _speech.errorListener = (SpeechRecognitionError error) {
      print("Error: ${error.errorMsg}");
    };
    _speech.statusListener = (String status) {
      if (status == "listening") {
        _isListening.value = true;
      } else if (status == "notListening") {
        _isListening.value = false;
      }
    };
  }
//var selectedLocale = Locale('ar', 'AE');

  void startListening() {
    if (_isAvailable.value && !_isListening.value) {
      _speech.listen(
        localeId: 'ar',
        partialResults: true, // تمكين النتائج الجزئية
        onResult: (result) {
          text.value = result.recognizedWords;
          print(text.value);
          if (text == _referenceText) {
            print("Match found!");
          }
        },
      );
    }
  }

  void stopListening() {
    if (_isListening.value) {
      _speech.stop();
      _isListening.value = false;
      text.value = "";
    }
  }
}
