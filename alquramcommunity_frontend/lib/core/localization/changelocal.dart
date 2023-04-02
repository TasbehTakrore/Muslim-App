import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.put(MyServices());

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    myServices.sharedPreferences.setBool("langSelected", true);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    //myServices.sharedPreferences.setBool("langSelected", false);

    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
