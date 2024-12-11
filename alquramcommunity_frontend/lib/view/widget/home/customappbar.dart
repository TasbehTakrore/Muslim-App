import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/view/widget/logowidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/auth/appbar_controller.dart';
import '../../../core/constant/constants.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressedIcon;
  const CustomAppBar({Key? key, this.onPressedIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;

    APPBarController appBarController = Get.put(APPBarController());
    return Container(
      color: AppColor.grey,
      margin: const EdgeInsets.only(top: 2),
      child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // logoWidget(logowidth: 70, sizeType: 2)),
            Expanded(
                flex: 1,
                child: Container(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        //textDirection: TextDirection.ltr,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                      Container(
                        // color: Colors.amber,
                        padding: const EdgeInsets.only(top: 2, left: 10),
                        height: 40,
                        width: 70,
                        child: Image.asset(AppImageAsset.mosqueLine,
                            fit: BoxFit.contain),
                      ),
                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     textDirection: TextDirection.rtl,
                      //     children: [
                      //       Container(
                      //           padding: const EdgeInsets.only(top: 5),
                      //           child: const Text("12",
                      //               style: TextStyle(
                      //                   color: Colors.black,
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.bold))),
                      //       const SizedBox(width: 10),
                      //       Container(
                      //           margin: const EdgeInsets.only(
                      //               top: 10, left: 8, right: 8),
                      //           child: Image.asset(AppImageAsset.diamond,
                      //               width: 28, height: 28))
                      //     ]),
                      const SizedBox(height: 2),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            Obx(() => Text(
                                  "${appBarController.coinsCount.value} نقطة",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                )),
                            const SizedBox(width: 0),
                            // Container(
                            //     margin:
                            //         const EdgeInsets.only(left: 11, right: 12),
                            //     child: Image.asset(AppImageAsset.coin,
                            //         width: 18, height: 18)),
                            const SizedBox(width: 9),
                          ])
                    ]))),

            Text(
              " مُسْلم",
              style: GoogleFonts.elMessiri(
                  fontWeight: FontWeight.w600,
                  //fontWeight: FontWeight.w500,
                  color: AppColor.primaryColor,
                  fontSize: 35),
            ),
          ]),
    );
  }
}
