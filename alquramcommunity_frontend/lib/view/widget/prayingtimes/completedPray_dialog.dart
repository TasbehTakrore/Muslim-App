import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';

class PrayerProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PrayScreenControllerImp prayController = Get.put(PrayScreenControllerImp());

    return Dialog(
      
      backgroundColor: Colors.transparent,
      child: Container(
        height: 330,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           const SizedBox(height: 10),
           Text(
           prayController.missedCounter>0? " إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَوْقُوتًا"
           :"Great ! You don't have missing prays \n",       
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              
              ),
              textAlign: TextAlign.center,
            
            ),
            SizedBox(height:10),
     
        CircularPercentIndicator(
              radius: 100,
              lineWidth: 15,
              backgroundColor: AppColor.thickYellow,
              percent:(prayController.prayCounter/5) ,
              center: new Text(
              "completed : ${prayController.prayCounter} / 5\n\n"+
              "missed : ${prayController.missedCounter} / 5\n\n"+
              "remain : ${prayController.remain} / 5",
              
             style: new TextStyle(color:AppColor.black,fontWeight: FontWeight.bold) ,
              ),
              progressColor: AppColor.primaryColor,
            ),
            SizedBox(height:10),
              Text(
           prayController.missedCounter>0? "Make Up Missing Prays ! "
           :"",       
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            
            ),
          ],
        ),
      ),
    );
  }
}
