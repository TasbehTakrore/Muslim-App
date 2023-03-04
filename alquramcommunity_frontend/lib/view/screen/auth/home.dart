import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/home/customCardHome.dart';
import '../../widget/home/customappbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(HomeControllerImp());
    return Scaffold(
      body:
          //GetBuilder<HomeControllerImp>(
          //  builder: (controller) => HandlingDataView(
          //    statusRequest: controller.statusRequest,
          // widget:
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  CustomAppBar(
                      titleappbar: "Find Product",
                      onPressedIcon: () {},
                      onPressedSearch: () {}),
                  CustomCardHome(
                      title: "2".tr, body: "{واستعينوا بالصّبر والصّلاة}"),
                  // const ListCategoriesHome(),
                  // const SizedBox(height: 10),
                  // const CustomTitleHome(title: "Product for you"),
                  // const SizedBox(height: 10),
                  // const ListItemsHome(),
                  // const CustomTitleHome(title: "Offer"),
                  // const SizedBox(height: 10),
                  // const ListItemsHome()
                ],
                //)
                //)
              )),
    );
  }
}
