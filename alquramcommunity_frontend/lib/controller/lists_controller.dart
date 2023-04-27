import 'package:get/get.dart';

class ListsController extends GetxController {
  int index = 1;
  changeIndex(int i) {
    index = i;
    update();
  }

  getIndex() {
    return index;
  }
}
