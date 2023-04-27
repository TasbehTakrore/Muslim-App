import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

class TrainerDialogController extends GetxController {
  MyServices service = Get.put(MyServices());

  int index = 1;
  void changeIndex(int v) {
    index = v;
    update();
  }

  int getIndex() {
    return index;
  }

  changePageIndex(int pageIndex) {
    service.recitation.setInt("surahTrainerIndex", pageIndex);
  }

  final _rangeValues = const RangeValues(1, 604).obs;

  set rangeValues(RangeValues value) => _rangeValues.value = value;
  RangeValues get rangeValues => _rangeValues.value;

  int get startPageIndex => rangeValues.start.round();
  int get endPageIndex => rangeValues.end.round();
}
