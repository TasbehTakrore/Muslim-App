import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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

}

class QiblaScreenControllerImp extends QiblaScreenController{
  @override
 Future<void> getCurrentLocation() async {
    try {
      // Get the user's current location
      final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      location.value = currentPosition;
      print('Current position: ${currentPosition.latitude}, ${currentPosition.longitude}');
      
    } catch (e) {
      print('Error getting current position: $e');
    }
  }
  
  }



