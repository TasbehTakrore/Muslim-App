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
}
