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
              ...List.generate(
                  5,
                  ((index) => index == 2
                      ? const Spacer()
                      : CustomButtonAppBar(
                          onPressed: () => controller
                              .changePage(index < 2 ? index : index - 1),
                          textbutton: controller
                              .titlebuttonAppBar[index < 2 ? index : index - 1],
                          iconbutton: controller
                              .iconsbuttonAppBar[index < 2 ? index : index - 1],
                          active: controller.currentPage ==
                                  (index < 2 ? index : index - 1)
                              ? true
                              : false)))
            ])));
  }
}
