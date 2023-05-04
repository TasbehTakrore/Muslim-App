import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/view/widget/logowidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/appbar_controller.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressedIcon;
  const CustomAppBar({Key? key, this.onPressedIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    APPBarController appBarController = Get.put(APPBarController());
    return Container(
      color: AppColor.grey,
      margin: const EdgeInsets.only(top: 2),
      child: Row(
          textDirection: TextDirection.ltr,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
                flex: 2, child: logoWidget(logowidth: 70, sizeType: 2)),
            Expanded(
                flex: 1,
                child: Container(
                    child: Column(
                        //textDirection: TextDirection.ltr,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          textDirection: TextDirection.ltr,
                          children: [
                            Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: const Text("12",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            const SizedBox(width: 10),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 8, right: 8),
                                child: Image.asset(AppImageAsset.diamond,
                                    width: 28, height: 28))
                          ]),
                      const SizedBox(height: 5),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          textDirection: TextDirection.ltr,
                          children: [
                            Text(
                              "${appBarController.coinsCount.value}",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            const SizedBox(width: 8),
                            Container(
                                margin:
                                    const EdgeInsets.only(left: 11, right: 12),
                                child: Image.asset(AppImageAsset.coin,
                                    width: 20, height: 20))
                          ])
                    ])))
          ]),
    );
  }
}
