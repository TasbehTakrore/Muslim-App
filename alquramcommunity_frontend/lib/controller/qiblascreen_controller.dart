import 'package:adhan/adhan.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../core/constant/color.dart';
import '../data/datasource/static.dart';

 abstract class QiblaScreenController extends GetxController {
  
  Future<void> getCurrentLocation();
    final location = Rx<Position>(Position(
      latitude: 0.0,
      longitude: 0.0,
      altitude: 0.0,
      accuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0, heading: 0.0,
      timestamp: DateTime.fromMillisecondsSinceEpoch(0)));
      final latitude = (0.0).obs;
      final longitude = (0.0).obs;
      final qiblaDirection = 0.0.obs;
      Rx<bool> allow = false.obs;

}

class QiblaScreenControllerImp extends QiblaScreenController{
   @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  void QiblaDialog() async{
    if(allow.obs.value==true){
     AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        title: ' Location Permission Required ',
        desc: 'Do you allow use your location for qibla ?',
        btnOkText: 'Allow',
        btnOkColor:AppColor.primaryColor,
        btnCancelText: 'Cancel',
        btnOkOnPress: () async {
          allow.value = true;
          getCurrentLocation();
         homeScreenController.changePage(7);
        },
        btnCancelOnPress: () => Get.back(),
      ).show();
      }
      else{
         homeScreenController.changePage(7);
      }
  }
  @override
 Future<void> getCurrentLocation() async {
    try {
      // Get the user's current location
      final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      location.value = currentPosition;
      latitude.value = location.value.latitude;
      longitude.value = location.value.longitude;
      qiblaDirection.value = calculateQiblaDirection(latitude.value, longitude.value);
    
      print("Qibladirection : '${qiblaDirection.value}'");
      
    } catch (e) {
      print('Error getting current position: $e');
    }
  }
   double calculateQiblaDirection(double latitude, double longitude) {
    final Coordinates coordinates=Coordinates(
        latitude,
        longitude,
    );
    final qiblaDirection = Qibla(coordinates);
    return qiblaDirection.direction;
  }

  
  }



