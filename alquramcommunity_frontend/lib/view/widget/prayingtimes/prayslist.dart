import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';

class PrayerTimesListView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final PrayScreenControllerImp prayController = Get.put(PrayScreenControllerImp());
    final Map<String, String> prayerTimes = prayController.prayerTimesmap.value;

return ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: prayerTimes.length,
  itemBuilder: (context, index) {
    final key = prayerTimes.keys.elementAt(index);
    final value = prayerTimes[key];
    //final isChecked = prayController.checkedItems.contains(index);
    return ClipRRect(
       borderRadius: BorderRadius.circular(15.0),
      child: Container(
        color: index==prayController.currentPrayer.value? AppColor.lightgreen:Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Obx(() =>
              Checkbox(
                value: prayController.trackPraying[index].value,
                onChanged: (bool? value) {
                 prayController.TrackPray(index,value);
                },
                activeColor: prayController.itemColors[index].value,
                
              ),
              ),
              SizedBox(width:5),
              Text(
                key,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Expanded(
                child: Text(
                  value ?? '',
                          textAlign: TextAlign.end,
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
              ),
              SizedBox(width:10),
              Obx(() =>
              IconButton(
                onPressed:(){
                  prayController.toggleAlarm(index);
                } ,
                icon: prayController.isAlarmOn[index].value ?Icon(Icons.alarm_on, color: Colors.black)
               : Icon(Icons.alarm_off, color: Color.fromARGB(255, 196, 0, 0)),
                
                )),
            ],
          ),
        ),
      ),
    );
    
  },
);


  }
}
