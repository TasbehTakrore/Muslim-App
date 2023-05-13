import 'package:get/get.dart';

class APPBarController extends GetxController {
  RxInt coinsCount = 0.obs;

  addCoins() {
    coinsCount.value += 2;
  }
}
