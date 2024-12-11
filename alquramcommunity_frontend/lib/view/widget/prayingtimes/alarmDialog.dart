import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../controller/alarmController.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';

class AlarmDialog extends StatelessWidget {
  final int indx;

  const AlarmDialog({super.key, required this.indx});
  @override
  Widget build(BuildContext context) {
    final AlarmController alarmController = Get.put(AlarmController());
    alarmController.initilal(indx);
    return Dialog(
      
      backgroundColor: Colors.transparent,
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:  Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text("Alarm Setting",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height:10),  
                Obx(() => 
                    DropdownButton(
                      items: ['Fajr','sunrise','Duhur','Asr','Maghrib','Isha'].map((e)=>DropdownMenuItem(child: Text('$e'),value:e)).toList(),       
                      value:alarmController.selectedItem.value,
                      elevation:2,
                      iconEnabledColor: AppColor.primaryColor,
                      onChanged: (val){
                        alarmController.onSelectedItemChanged(val);
                      },
                     ),),
                const SizedBox(height:15), 
                Row(
                  children: [
                    Text("On time Alarm ?",style: TextStyle(fontSize: 15),),
                  ],
                )
        
                  ],
              
          ),
        ),
      ),
    );
  }
}
