import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/core/services/mistake_services.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:quran/quran.dart';

import '../../../controller/homescreen_controller.dart';
import '../../../controller/lists_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';
import '../../controller/notificationController.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());

    Get.put(NotificationController());
 initializeDateFormatting('ar_SA', null);

    return GetBuilder<NotificationController>(builder: (controller) {
      return FutureBuilder(
          future: controller.getNotifications(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } 
      else if (snapshot.connectionState == ConnectionState.waiting) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }   
           else if (!snapshot.hasData || snapshot.data.length == 0) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.notifications_off,
                size: 100,
                color: AppColor.secondaryColor,
              ),
              SizedBox(height: 15),
              Text(
                'لا يوجد لديك أي إشعارات ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
    
    
      } 
            
            else  {
              return SizedBox(
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height / 1.4,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          // CategoryList[index].onPressed,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColor.lightYellow,
                                  borderRadius: BorderRadius.circular(15)),
                              width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.height / 7,
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //surah name
                                    // Text(
                                    //   "${index + 1}",
                                    //   textAlign: TextAlign.end,
                                    // ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                         snapshot.data[index]["Notifytitle"],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                                                            
                                        Text(
                                        DateFormat('yyyy/dd/MM الساعة  hh:mm a', 'ar_SA').format(DateTime.parse(snapshot.data[index]['createdAt'])),
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                      ],
                                    ),
                                    Divider(),
                                
                                    Text(
                                      snapshot.data[index]["Notifybody"],
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(fontSize: 16),
                                    ),

                                    // Text(snapshot.data[index]),
                                  ])),
                          onTap: () {
                          Get.toNamed(AppRoute.home);
                          homeScreenControllerImp.changePage(1);

                          }
                       
                       
                        ),
                        const SizedBox(height: 4),
                      ],
                    );
                  },
                ),
              );
            }
        
    },
  );
});


  }
}
