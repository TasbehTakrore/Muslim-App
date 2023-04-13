import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../core/services/services.dart';
import 'recitationscreen_controller.dart';

class SmartRecitationDialogController extends GetxController {
  var isSubmitted = false.obs;
  final _rangeValues = const RangeValues(1, 604).obs;
  final RxBool _isChecked = false.obs;
  MyServices service = Get.put(MyServices());

  set isChecked(bool value) => _isChecked.value = value;
  bool get isChecked => _isChecked.value;

  set rangeValues(RangeValues value) => _rangeValues.value = value;
  RangeValues get rangeValues => _rangeValues.value;

  int get startPageIndex => rangeValues.start.round();
  int get endPageIndex => rangeValues.end.round();
  RecitationScreenController recitationConroller =
      Get.put(RecitationScreenController());

  void submitForm() {
    isSubmitted.value = true;
    service.recitation.setInt("startPage", startPageIndex);
    service.recitation.setInt("endPage", endPageIndex);
    recitationConroller.emptyLists();
    //print("++++++++++" + service.recitation.getInt("endPage").toString());
    Get.toNamed(AppRoute.recitation);
    // Perform business logic here
  }
}
