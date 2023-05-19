import 'package:alquramcommunity_frontend/view/widget/Plan/activateplandialog.dart';

import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/plan_controller.dart';

import '../../../core/constant/color.dart';
import 'prayPlanCardSetPlan.dart';
import 'qurahPlanCardSetPlan.dart';
import 'recitationPlanSetPlan.dart';
import 'tadabborPlanCardSetPlan.dart';
import 'thikrPlanCardSetPlan.dart';

class CreatePlanContent extends StatelessWidget {
  const CreatePlanContent({super.key});

  @override
  Widget build(BuildContext context) {
    final PlanController planController =
        Get.put(PlanController());

    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height / 2,
      width: 400,
      child: ListView(
        children: [
// <<<<<<< HEAD
          Divider(),
          PrayPalnCardSetPlan(),
          ThikrPalnCardSetPlan(),
          QuranPlanCardSetPlan(),
          TadabborPlanCardSetPlan(),
// =======
//          const Divider(),
//           const PrayPalnCardSetPlan(),
//          const ThikrPalnCardSetPlan(),
//         const  QuranPlanCardSetPlan(),
//         const  TadabborPlanCardSetPlan(),
// >>>>>>> main
          RecitationPlanCardSetPlan(),
          SizedBox(height: 10),
          Container(
            child: EasyElevatedButton(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(15),
                label: "تفعيل الخطّة الجديدة",
                isRounded: true,
                labelStyle: Theme.of(context).textTheme.bodyLarge,
                //height: ,
                labelColor: AppColor.grey,
                color: AppColor.primaryColor,
// <<<<<<< HEAD
                onPressed: ()  {
                   showDialog(
                      context: context,
                      builder: (BuildContext b) {
                      return ActivatePlanDialog();
                    });
// =======
//                 onPressed: () {
//                   Get.back();
// >>>>>>> main
                }),
          )
        ],
      ),
    );
  }
}
