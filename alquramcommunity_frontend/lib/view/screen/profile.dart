import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../widget/home/statisticscard.dart';
import '../widget/profile/editprofiledialog.dart';
import '../widget/profile/profilecard.dart';
import '../widget/profile/profiletop.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColor.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Container(
              margin: EdgeInsets.only(top: 70, bottom: 10),
              decoration: const BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(20))),
              child: ProfileCard(),
            ),
          ),
          Container(
            height: 170,
            decoration: const BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.dialog(EditProfile());
                  },
                  child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child:
                          Icon(Icons.settings, size: 30, color: Colors.white)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        height: 200,
                        width: width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Text(
                              "Ayah Shraim",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            SizedBox(height: 5),
                            Text("(22 year),Palestine",
                                style: TextStyle(fontSize: 10)),
                            SizedBox(height: 20),
                            ProfileTop(),
                          ],
                        ))),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: width / 4,
            right: width / 4,
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(AppImageAsset.profile)),
            ),
          ),
        ],
      ),
    );
  }
}
