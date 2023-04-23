import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/prayscreen_controller.dart';

class PrayerProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PrayScreenControllerImp prayController = Get.put(PrayScreenControllerImp());
        prayController.CompletedPray();

    return Dialog(
      
      backgroundColor: Colors.transparent,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           const SizedBox(height: 20),
            const Text(
              'Your Prayer Progress !',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
             Text("completed : ${prayController.prayCounter} / 5"),
             const SizedBox(height: 20),
             Text("missed : ${prayController.missedCounter} / 5"),


          ],
        ),
      ),
    );
  }
}
