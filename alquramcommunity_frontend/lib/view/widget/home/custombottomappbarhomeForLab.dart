import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/plan_controller.dart';
import '../../../controller/homescreen_controller.dart';
import '../../../controller/profileController.dart';
import 'custombuttonappbar.dart';

class CustomBottonAppBarHomeForLab extends StatelessWidget {
  const CustomBottonAppBarHomeForLab({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profilesController = Get.put(ProfileController());
    final PlanController planController = Get.put(PlanController());

    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Container(
            margin: EdgeInsets.only(top: 80, bottom: 50),
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            // color: Colors.transparent,
            height: MediaQuery.of(context).size.height,
            // shape: const CircularNotchedRectangle(),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtonAppBar(
                      onPressed: () => controller.changePage(4),
                      textbutton: "Home",
                      iconbutton: Icons.home,
                      size: 40,
                      defColor: Colors.white,
                      activeColor: AppColor.thickYellow,
                      active: controller.currentPage == (4) ? true : false),
                  CustomButtonAppBar(
                      onPressed: () {
                        profilesController.userInformation();
                        controller.changePage(0);
                      },
                      textbutton: controller.titlebuttonAppBar[0],
                      size: 40,
                      defColor: Colors.white,
                      activeColor: AppColor.thickYellow,
                      iconbutton: controller.iconsbuttonAppBar[0],
                      active: controller.currentPage == (0) ? true : false),

                  CustomButtonAppBar(
                      onPressed: () async {
                        await planController.getRemainingTime();
                        await planController.showPlantoUser();
                        await planController.dailyProgress();
                        controller.changePage(1);
                      },
                      textbutton: controller.titlebuttonAppBar[1],
                      iconbutton: controller.iconsbuttonAppBar[1],
                      size: 40,
                      defColor: Colors.white,
                      activeColor: AppColor.thickYellow,
                      active: controller.currentPage == (1) ? true : false),
                  CustomButtonAppBar(
                      onPressed: () => controller.changePage(2),
                      textbutton: controller.titlebuttonAppBar[2],
                      iconbutton: controller.iconsbuttonAppBar[2],
                      size: 40,
                      defColor: Colors.white,
                      activeColor: AppColor.thickYellow,
                      active: controller.currentPage == (2) ? true : false),

                  CustomButtonAppBar(
                      onPressed: () => controller.changePage(3),
                      textbutton: controller.titlebuttonAppBar[3],
                      iconbutton: controller.iconsbuttonAppBar[3],
                      size: 40,
                      defColor: Colors.white,
                      activeColor: AppColor.thickYellow,
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
