import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import '../../../controller/prayscreen_controller.dart';

class LocationPermissionDialog extends StatelessWidget {
  final Function onAllow;

  LocationPermissionDialog({required this.onAllow});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Get.find<PrayScreenControllerImp>()
              .location
              .value
              .latitude != 0.0 &&
          Get.find<PrayScreenControllerImp>()
              .location
              .value
              .longitude != 0.0) {
        return AlertDialog(
          title: Text('Allow Location Access?'),
          content: Text('This app requires access to your location.'),
          actions: [
            TextButton(
              child: Text('Deny'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text('Allow'),
              onPressed: () async {
                final status = await Geolocator.checkPermission();
                if (status == LocationPermission.denied ||
                    status == LocationPermission.deniedForever) {
                  final result =
                      await Geolocator.requestPermission().then((value) {
                    if (value == LocationPermission.whileInUse ||
                        value == LocationPermission.always) {
                      onAllow();
                    }
                  });
                  if (result == LocationPermission.denied ||
                      result == LocationPermission.deniedForever) {
                    Get.snackbar('Permission denied',
                        'Location access is required for this app to function properly',
                        duration: Duration(seconds: 5),
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                  }
                } else if (status == LocationPermission.always ||
                    status == LocationPermission.whileInUse) {
                  onAllow();
                }
                Get.back();
              },
            ),
          ],
        );
      } else {
        return SizedBox.shrink();
      }
    });
  }
}
