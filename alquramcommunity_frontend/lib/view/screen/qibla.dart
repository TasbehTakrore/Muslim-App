import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/prayscreen_controller.dart';
import '../../controller/qiblascreen_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../widget/home/customcardhome.dart';
import '../widget/prayingtimes/completedPray_dialog.dart';
import '../widget/prayingtimes/location_dialog.dart';
import '../widget/prayingtimes/prayingtopCard.dart';
import '../widget/prayingtimes/prayslist.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final QiblaScreenControllerImp qiblaController = Get.put(QiblaScreenControllerImp());
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed(AppRoute.home);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: Column(
          children: [
            const SizedBox(height:30),
            const Center(
              child: Text("Qibla Compass",
              style: TextStyle(color:AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 25),),
            ),
           const SizedBox(height:30),

          ],
        ),
            ),
          );
        
      
    
  }
}
