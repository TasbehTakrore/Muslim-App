import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late SharedPreferences recitation;
  late SharedPreferences quranPage;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    recitation = await SharedPreferences.getInstance();
    quranPage = await SharedPreferences.getInstance();
    //sharedPreferences.remove("langSelected");
    return this;
    
  }
}


initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
