import 'package:alquramcommunity_frontend/controller/auth/plan_controller.dart';
import 'package:alquramcommunity_frontend/view/widget/prayingtimes/completedPray_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
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
              height: 170,
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
                  /*
                   Row(
                     children: [
                       GestureDetector(
                        child: Icon(Icons.upcoming),
                        onTap: () async {
                           await planController.dayEnd();
                        },
                       ),
                       GestureDetector(
                        child: Icon(Icons.person),
                        onTap: () async {
                           await planController.weekCalc();
                        },
                       ),
                       SizedBox(width: 20,),
                           GestureDetector(
                        child: Icon(Icons.notification_add),
                        onTap: ()  {
                            planController.callNotification();
                        },
                       ),
                     ],
                   ),
                  */
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 8, 0, 8),
                        child: LinearPercentIndicator(
                          
                          percent: planController.progress.value,
                          width: MediaQuery.of(context).size.width / 1.3,
                          lineHeight: 20,
                          animation: true,
                          progressColor: Color.fromARGB(193, 252, 204, 92),
                          backgroundColor: Color(0xFFE0E3E7),
                          barRadius: Radius.circular(10),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      // const Text(
                      //   "..75% ",
                      //   style: TextStyle(
                      //       fontSize: 12, color: AppColor.thickYellow),
                      // )
                    ],
                  ),

                ],
              )),),
        ]),
      ),
    );
  }
}




