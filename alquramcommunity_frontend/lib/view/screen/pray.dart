import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/prayscreen_controller.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../widget/home/customcardhome.dart';
import '../widget/prayingtimes/completedPray_dialog.dart';
import '../widget/prayingtimes/prayingtopCard.dart';
import '../widget/prayingtimes/prayslist.dart';

class PrayScreen extends StatelessWidget {
  PrayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PrayScreenControllerImp prayController =
        Get.put(PrayScreenControllerImp());
    prayController.onInit();
    return WillPopScope(
        onWillPop: () async {
          Get.toNamed(AppRoute.home);
          return false;
        },
        child: FutureBuilder(
            future: prayController.getNextPrayer(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else if (snapshot.hasData) {
                print(snapshot.data);
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.bottom,
                  child: SingleChildScrollView(
                    // wrap Column widget in SingleChildScrollView
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => PrayCardHome(
                              heigh: 200,
                              date: prayController.formativeCurrentDate.value,
                              hijridate:
                                  prayController.formativeHijriDate.value,
                              fontSize1: 17,
                              fontSize2: 15,
                              nextPray: prayController
                                  .changePrayToArabic(
                                      prayController.nextPrayer.value.name)
                                  .toUpperCase(),
                              city_name: prayController.city.value,
                              remainingTime:
                                  prayController.formattedRemainingTime.value,
                            )),
                        SizedBox(height: 10),
                        Obx(() {
                          final prayerTimes =
                              prayController.prayerTimesmap.value;
                          if (prayerTimes == null) {
                            return CircularProgressIndicator(); // Show a loading spinner
                          } else {
                            return PrayerTimesListView();
                          }
                        })
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: CircularProgressIndicator())),
                );
              }
            }));
  }
}
