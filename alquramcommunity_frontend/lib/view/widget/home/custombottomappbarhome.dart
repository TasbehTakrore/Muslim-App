import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/homescreen_controller.dart';
import 'custombuttonappbar.dart';

class CustomBottonAppBarHome extends StatelessWidget {
  const CustomBottonAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(children: [
              CustomButtonAppBar(
                  onPressed: () => controller.changePage(0),
                  textbutton: controller.titlebuttonAppBar[0],
                  iconbutton: controller.iconsbuttonAppBar[0],
                  active: controller.currentPage == (0) ? true : false),

              CustomButtonAppBar(
                  onPressed: () => controller.changePage(1),
                  textbutton: controller.titlebuttonAppBar[1],
                  iconbutton: controller.iconsbuttonAppBar[1],
                  active: controller.currentPage == (1) ? true : false),
              const Spacer(),

              CustomButtonAppBar(
                  onPressed: () => controller.changePage(2),
                  textbutton: controller.titlebuttonAppBar[2],
                  iconbutton: controller.iconsbuttonAppBar[2],
                  active: controller.currentPage == (2) ? true : false),

              CustomButtonAppBar(
                  onPressed: () => controller.changePage(3),
                  textbutton: controller.titlebuttonAppBar[3],
                  iconbutton: controller.iconsbuttonAppBar[3],
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
