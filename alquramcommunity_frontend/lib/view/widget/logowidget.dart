import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class logoWidget extends StatelessWidget {
  final double logowidth;
  final int sizeType;

  const logoWidget(
      {super.key, required this.logowidth, required this.sizeType});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        //color: Colors.red,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //padding: EdgeInsets.only(top: ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoute.home);
            },
            child: Container(
              padding: const EdgeInsets.only(top: 2),
              child: Image.asset(
                AppImageAsset.quranLogo,
                width: logowidth,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 6, right: 6),
            // color: Colors.amber,
            child: Column(children: [
              Text(
                "Al-Quran",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: sizeType == 1 ? 35 : 20,
                    color: AppColor.primaryColor),
              ),
              Container(
                //width: 50,
                //color: Colors.amber,
                alignment: Alignment.bottomRight,
                child: Text(
                  "Community    ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: sizeType == 1 ? 20 : 12,
                      color: AppColor.black),
                ),
              ),
            ]),
          )
        ]));
  }
}
