import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/notificationServices.dart';
import 'alarmDialog.dart';

class PrayerTimesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PrayScreenControllerImp prayController =
        Get.put(PrayScreenControllerImp());

    final Map<String, String> prayerTimes = prayController.prayerTimesmap.value;
    // NotificationServices notificationServices = Get.put(NotificationServices());
    final double checkboxSize = MediaQuery.of(context).size.width * 0.1;
    final double iconButtonSize = MediaQuery.of(context).size.width * 0.08;
    final double textSize = MediaQuery.of(context).size.width * 0.042;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: prayerTimes.length,
      itemBuilder: (context, index) {
        final key = prayerTimes.keys.elementAt(index);
        final value = prayerTimes[key];
        //final isChecked = prayController.checkedItems.contains(index);
        return GestureDetector(
          onTap: () async {
            // notificationServices.requestNotificationPermissions();
            // notificationServices.sendNotification();
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: index == prayController.currentPrayer.value
                    ? AppColor.lightgreen
                    : Color.fromARGB(96, 245, 245, 245),
                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.0030),
                  child: Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: prayController.trackPraying[index].value,
                          onChanged: (bool? value) {
                            prayController.TrackPray(index, value);
                          },
                          activeColor: prayController.itemColors[index].value,
                          visualDensity: VisualDensity.compact,
                          splashRadius: checkboxSize * 0.6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          checkColor: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        prayController.changePrayToArabic(key),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: textSize),
                      ),
                      Expanded(
                        child: Text(
                          // value ?? '..',
                          prayController.changeTimeToArabic(value!) ?? '..',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: textSize),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Obx(
                      //   () => IconButton(
                      //     onPressed: () {
                      //       prayController.toggleAlarm(index);
                      //     },
                      //     iconSize: iconButtonSize,
                      //     icon: prayController.isAlarmOn[index].value
                      //         ? Icon(Icons.alarm_on, color: Colors.black)
                      //         : Icon(Icons.alarm_off,
                      //             color: Color.fromARGB(255, 196, 0, 0)),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
