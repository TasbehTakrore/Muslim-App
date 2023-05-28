import 'package:alquramcommunity_frontend/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/thikrCatgController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/constants.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/routes.dart';

class ThikrHomeCard2 extends StatelessWidget {
  const ThikrHomeCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThikrCatgControllerImp controller = Get.put(ThikrCatgControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;

    return GridView.builder(
      itemCount: ThikrCategoryList.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isLaptopScreen == true ? 4 : 2,
        childAspectRatio:isLaptopScreen==true? 2:1,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 7),
          margin: isLaptopScreen == true
              ? EdgeInsets.symmetric(vertical: 8, horizontal: 8)
              : EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: AppColor.lightYellow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () async {
                  await controller.selectThikr(index);
                  Get.toNamed(AppRoute.thikrdetails, arguments: ['$index']);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 2, left: 10, right: 10, bottom: 2),
                  height: isLaptopScreen == true ? 120 : 90,
                  width: isLaptopScreen == true ? 120 : 90,
                  child: Image.asset("${ThikrCategoryList[index].image}"),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: index == 2 ? 2 : 13),

                  // padding:,
                  alignment: Alignment.bottomCenter,
                  child: Text("${ThikrCategoryList[index].title}",
                      style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: index < 5 ? 14 : 14,
                          fontFamily: "Cairo"))),
            ],
          ),
        );
      },
    );
  }
}
