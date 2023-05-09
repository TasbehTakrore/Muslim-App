import 'package:alquramcommunity_frontend/controller/auth/plan_controller.dart';
import 'package:alquramcommunity_frontend/view/widget/prayingtimes/completedPray_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';

import '../../../controller/prayscreen_controller.dart';

class PlanMainCard extends StatelessWidget {
  // final String date;
  // final String hijridate;
  // void Function()? onTap;
  // final double fontSize1;
  // final double fontSize2;
  // final double heigh;
  // final String remainingTime;

  PlanMainCard({
    Key? key,
    // required this.date,
    // required this.hijridate,
    // this.onTap,
    // required this.fontSize1,
    // required this.fontSize2,
    // required this.heigh,
    // required this.remainingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlanController planController =
        Get.put(PlanController());
    return InkWell(
       onTap: (){
      
       },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Stack(children: [
          Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(AppImageAsset.mosque),
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff266f52), Color(0xff266f52)],
                  )),
              alignment: Alignment.center,
              width: double.infinity,
              height: 150,
              child: Obx(() =>  Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Time left to finish the plan",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                  
                  Text(planController.formattedRemainingTime.value,
                      style:
                          const TextStyle(color: Colors.yellow, fontSize: 50)),
                  const SizedBox(height:5),
                  GestureDetector(
                    onTap: () async {
                      await planController.setUpdatePlan();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: AppColor.grey,
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text("أنقر لتفعيل الخطة",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),

                ],
              )),),
        ]),
      ),
    );
  }
}
