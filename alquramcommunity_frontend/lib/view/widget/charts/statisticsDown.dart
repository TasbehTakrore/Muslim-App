import 'package:alquramcommunity_frontend/controller/auth/chartsController.dart';
import 'package:alquramcommunity_frontend/controller/auth/plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class StatisticDown extends StatelessWidget {
   StatisticDown({Key? key}) : super(key: key);
   ChartsController chartsController=Get.put(ChartsController());

  @override
  Widget build(BuildContext context) {
    chartsController.fetchTasbehData();
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Card(
              color: AppColor.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await tasbehController.addTasbehCount();
                        await chartsController.fetchTasbehData();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.refresh,
                            color: AppColor.thickYellow,
                            size: 24,
                            
                          
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'قضيت في التدريب هذا الأسبوع',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                   // Obx(() =>
                   Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                    Text( "دقيقة",
                      style: TextStyle(
                        color: AppColor.thickYellow,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                     Text( " 30",
                      style: TextStyle(
                        color: AppColor.thickYellow,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),

                  
                    ],
                   )
                    
                  //  ),
                  ],
                ),
              ),
            ),
          ),
        
          Expanded(
            child: Card(
              color: AppColor.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await tasbehController.addTasbehCount();
                        await chartsController.fetchTasbehData();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.refresh,
                            color: AppColor.thickYellow,
                            size: 24,
                            
                          
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'عدد تسبيحات هذا الأسبوع',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Obx(() =>
                      Text('${chartsController.tasbehData.value.toString()}',
                      style: TextStyle(
                        color: AppColor.thickYellow,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        
        ],
      ),
    );
  }

}