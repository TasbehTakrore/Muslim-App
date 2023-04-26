import 'package:alquramcommunity_frontend/controller/prayscreen_controller.dart';
import 'package:get/get.dart';

class AlarmController extends GetxController {
 final RxString selectedItem = "".obs;
 List<String> items = ['Fajr','sunrise','Duhur','Asr','Maghrib','Isha'];
  final PrayScreenControllerImp prayController = Get.put(PrayScreenControllerImp());
@override
  void onInit() {
    super.onInit();
  }

  void initilal(int ind){
    selectedItem.value= items[ind];
  }
  void onSelectedItemChanged(String? newValue) {
    selectedItem.value = newValue!;
  }


}

