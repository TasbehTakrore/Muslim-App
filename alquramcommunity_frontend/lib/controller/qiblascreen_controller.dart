import 'dart:async';
import 'dart:math';

import 'package:adhan/adhan.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import '../core/constant/color.dart';
import '../data/datasource/static.dart';
import '../view/widget/qiblah/LocationErrorWidget.dart';
/*
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
*/
class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}
class  _QiblahCompassState extends State<QiblahCompass>{
   @override
  void initState() {
    _checkLocationStatus() ;
    super.initState();
  }

   @override
  void dispose(){
     _locationStreamController.close();
    FlutterQiblah().dispose();
    super.dispose();
  }
/*
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
 */
final _locationStreamController=StreamController<LocationStatus>.broadcast();
get stream => _locationStreamController.stream ;
Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

@override
 Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();

              case LocationPermission.denied:
                return LocationErrorWidget(
                  error: "Location service permission denied",
                  callback: _checkLocationStatus,
                );
              case LocationPermission.deniedForever:
                return LocationErrorWidget(
                  error: "Location service Denied Forever !",
                  callback: _checkLocationStatus,
                );
              default:
                return Container();
            }
          } else {
            return LocationErrorWidget(
              error: "Please enable Location service",
              callback: _checkLocationStatus,
            );
          }
        },
      ),
    );
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset('assets/images/compass.svg');
  final _needleSvg = SvgPicture.asset(
    'assets/images/needle.svg',
    fit: BoxFit.contain,
    height: 300,
    alignment: Alignment.center,
  );

  @override
 Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(child: CircularProgressIndicator(),);
          }

        final qiblahDirection = snapshot.data!;

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: (qiblahDirection.direction * (pi / 180) * -1),
              child: _compassSvg,
            ),
            Transform.rotate(
              
              angle: (qiblahDirection.qiblah * (pi / 180) * -1),
              alignment: Alignment.center,
              child: _needleSvg,
            ),
            Positioned(
              bottom: 8,
              child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
            )
          ],
        );
      },
    );
  }
}




