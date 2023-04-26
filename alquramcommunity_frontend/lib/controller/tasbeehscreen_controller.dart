import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../view/widget/Tasbeeh/customdropdown.dart';

class TasbeehScreenController extends GetxController {
  List<String> tasbehTypes = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلّا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله",
    "أستغفر الله",
    "اللهمّ صلّ على محمّد"
  ];
  List<Rx<int>> tasbehValue = [
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
  ];

  int typeIndex = 0;
  getValue() {
    return tasbehValue[typeIndex].value;
  }

  changeValue() {
    tasbehValue[typeIndex].value += 1;
    update();
  }

  changeIteamIndex(String element) {
    typeIndex = tasbehTypes.indexOf(element);
    update();
  }

  gettasbeehtype() {
    return tasbehTypes[typeIndex];
  }
}
