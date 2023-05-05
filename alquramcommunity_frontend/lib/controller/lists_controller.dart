import 'package:alquramcommunity_frontend/controller/homescreen_controller.dart';
import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:alquramcommunity_frontend/core/services/mistake_services.dart';
import 'package:alquramcommunity_frontend/data/model/backend_to_front_models/mistake_model.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

class ListsController extends GetxController {
  int index = 1;
  MyServices myServices = Get.put(MyServices());
  QuranPageController quranPageController = Get.put(QuranPageController());
  var mistakes = <MistakeModel>[].obs;
  String? userEmail;
  RxList visibilityList = [].obs;
  RxList mistakesList = [].obs;
  changeIndex(int i) {
    index = i;
    update();
  }

  getIndex() {
    return index;
  }

  Future<List<MistakeModel>> getMistakes() async {
    return MistakeServices.getMistakes(userEmail!);
    // mistakesList.value = await MistakeServices.getMistakes("tasbeh.takrore@gmail.com");
  }

  void deleteMistake(int surahID, int ayahID) {
    MistakeServices.deleteMistake(userEmail!, surahID, ayahID);
  }


  @override
  void onInit() {
    userEmail = myServices.sharedPreferences.getString("user_email");

    // TODO: implement onInit

    super.onInit();
  }
}
