import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {"1": "اختر اللُغة..", "2": "آية اليوم.."},
        "en": {"1": "Choose Language..", "2": "Today's verse.."},
      };
}
