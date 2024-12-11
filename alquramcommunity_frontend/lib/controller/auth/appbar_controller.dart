import 'package:get/get.dart';

import '../../core/services/services.dart';

class APPBarController extends GetxController {
  RxInt coinsCount = 0.obs;
  MyServices myServices = Get.put(MyServices());

  @override
  void onInit() {
    super.onInit();
    getCoins();
    // audioPlayer = AudioPlayer();
    // if (formattedRemainingTime == '00:00:00') {
    //   getNextPrayer();
  }

  void getCoins() {
    myServices.sharedPreferences.getInt("user_coins") == null
        ? coinsCount.value = 0
        : coinsCount.value = myServices.sharedPreferences.getInt("user_coins")!;
  }

  addCoins() {
    coinsCount.value += 2;
  }
}
