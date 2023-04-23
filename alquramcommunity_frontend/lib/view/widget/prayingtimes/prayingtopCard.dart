import 'package:alquramcommunity_frontend/view/widget/prayingtimes/location_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/prayscreen_controller.dart';

class PrayCardHome extends StatelessWidget {
  final String date;
  final String hijridate;
  void Function()? onTap;
  final double fontSize1;
  final double fontSize2;
  final double heigh;
  final String nextPray;
  final String city_name;
  final String remainingTime;

  PrayCardHome(
      {Key? key,
      required this.date,
      required this.hijridate,
      this.onTap,
      required this.fontSize1,
      required this.fontSize2,
      required this.heigh, required this.nextPray,
      required this.city_name,
       required this.remainingTime, 
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
        final PrayScreenControllerImp prayController = Get.put(PrayScreenControllerImp());
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color.fromARGB(255, 38, 194, 145), Color.fromARGB(255, 10, 133, 96)],
                )),
            width: double.infinity,
            height: heigh,
            child: Column(
              
              children: [
                const SizedBox(height: 10,),
                Text(date,
                  style: TextStyle(color: Colors.white, fontSize: fontSize2),textAlign: TextAlign.right,),
                const SizedBox(height: 10),
                Text(hijridate,
                  style: TextStyle(color: Colors.yellow, fontSize: fontSize1)),
                const SizedBox(height: 10),
                Text(nextPray,
                  style: const TextStyle(color: Colors.white, fontSize: 45)),
                const SizedBox(height: 3),
                Text("After +  ${remainingTime}",
                  style: const TextStyle(color: Colors.yellow, fontSize: 15)),
                Row (
                  children: [
                     const SizedBox(width: 3),
                     const Icon (
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          LocationPermissionDialog(
                            onAllow: (){ 
                            prayController.getCurrentLocation();
                            }
                            );
                            print("f");
                        },
                        child: Text(
                        city_name,
                        style: 
                        TextStyle(color: Colors.white,
                        fontSize: fontSize1)),
                      ),
                     
                  ],
                )
              ],
            )

          ),
        ]),
      ),
    );
  }
}
