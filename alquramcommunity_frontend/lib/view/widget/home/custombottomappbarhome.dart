import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/plan_controller.dart';
import '../../../controller/homescreen_controller.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../controller/profileController.dart';
import 'custombuttonappbar.dart';

class CustomBottonAppBarHome extends StatelessWidget {
  const CustomBottonAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profilesController = Get.put(ProfileController());
    final PlanController planController = Get.put(PlanController());
    final PrayScreenControllerImp prayController = Get.put(PrayScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(children: [

              CustomButtonAppBar(
                  onPressed: () {
                    profilesController.userInformation();
                    controller.changePage(0);
                  },
                  textbutton: controller.titlebuttonAppBar[0],
                  iconbutton: controller.iconsbuttonAppBar[0],
                  size: 28,
                  defColor: Colors.black,
                  activeColor: AppColor.primaryColor,
                  active: controller.currentPage == (0) ? true : false),

              CustomButtonAppBar(
                  onPressed: () async {
                    await planController.getRemainingTime();
                    await planController.showPlantoUser();
                    await planController.dailyProgress();
                    await prayController.CompletedPray();
                    await planController.planPray();
                    // await planController.sumPray();

                    controller.changePage(1);
                  },
                  textbutton: controller.titlebuttonAppBar[1],
                  iconbutton: controller.iconsbuttonAppBar[1],
                  size: 28,
                  defColor: Colors.black,
                  activeColor: AppColor.primaryColor,
                  active: controller.currentPage == (1) ? true : false),
              const Spacer(),

              CustomButtonAppBar(
                  onPressed: () => controller.changePage(2),
                  textbutton: controller.titlebuttonAppBar[2],
                  iconbutton: controller.iconsbuttonAppBar[2],
                  size: 28,
                  defColor: Colors.black,
                  activeColor: AppColor.primaryColor,
                  active: controller.currentPage == (2) ? true : false),

              CustomButtonAppBar(
                  onPressed: () => controller.changePage(3),
                  textbutton: controller.titlebuttonAppBar[3],
                  iconbutton: controller.iconsbuttonAppBar[3],
                  size: 28,
                  defColor: Colors.black,
                  activeColor: AppColor.primaryColor,
                  active: controller.currentPage == (3) ? true : false),
              // ...List.generate(
              //     5,
              //     ((index) => index == 2
              //         ? const Spacer()
              //         : CustomButtonAppBar(
              //             onPressed: () => controller
              //                 .changePage(index < 2 ? index : index - 1),
              //             textbutton: controller
              //                 .titlebuttonAppBar[index < 2 ? index : index - 1],
              //             iconbutton: controller
              //                 .iconsbuttonAppBar[index < 2 ? index : index - 1],
              //             active: controller.currentPage ==
              //                     (index < 2 ? index : index - 1)
              //                 ? true
              //                 : false)
            ])));
  }
}
