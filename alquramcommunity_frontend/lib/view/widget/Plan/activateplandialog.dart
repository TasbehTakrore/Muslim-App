import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/plan_controller.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

class ActivatePlanDialog extends StatelessWidget {
  ActivatePlanDialog({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(PlanController());
PlanController planController=Get.put(PlanController());
    return GetBuilder<PlanController>(
        builder: (controller) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              content: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("قد يؤدي تفعيل الخطة الجديدة إلى حذف جميع بياناتك السابقة إذا لم تقم بالاحتفاظ بها الآن",style:TextStyle(),textAlign: TextAlign.center,),
                    const Divider(),
                     CustomButton(
                      color: AppColor.primaryColor,
                      onPressed: () async {
                        planController.setDataStatus(1);
                        await planController.refreshTaskss();
                        await planController.setUpdatePlan();
                        await planController.showPlantoUser();
                        await planController.dailyProgress();
                        Get.back();
                      } ,
                      textbutton: 'الاحتفاظ بنسخة',
                    ),
                    CustomButton(
                      color: Color.fromARGB(213, 201, 2, 2),
                      onPressed: () async {
                        await planController.deleteData();
                        planController.setDataStatus(0);
                        await planController.setUpdatePlan();
                        await planController.refreshTaskss();
                        await planController.showPlantoUser();
                        await planController.dailyProgress();

                        Get.back();
                      },
                      textbutton: 'حذف جميع الخطط',
                    ),
                   
                  ],
                ),
              ),
            ));
  }
}
