import 'package:alquramcommunity_frontend/controller/homescreen_controller.dart';
import 'package:alquramcommunity_frontend/core/services/mistake_services.dart';
import 'package:alquramcommunity_frontend/data/model/backend_to_front_models/mistake_model.dart';
import 'package:get/get.dart';

class ListsController extends GetxController {
  int index = 1;
  var mistakes = <MistakeModel>[].obs;
  String userEmail = "tasbeh.takrore@gmail.com";
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
    return MistakeServices.getMistakes(userEmail);
    // mistakesList.value = await MistakeServices.getMistakes("tasbeh.takrore@gmail.com");
  }

  void deleteMistake(int surahID, int ayahID) {
    MistakeServices.deleteMistake(userEmail, surahID, ayahID);
  }

  void createVisibilityList(length) {
    visibilityList.addAll(List.generate(length, (_) => true));
    //homeScreenController.changePage(2);
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit

  //   super.onInit();
  // }
}
