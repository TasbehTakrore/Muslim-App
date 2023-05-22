import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/profileController.dart';
import '../../core/constant/color.dart';
import '../../core/constant/constants.dart';
import '../../core/constant/imageasset.dart';
import '../../core/services/services.dart';
import '../../provider/userprovider.dart';
import '../widget/auth/bottomsheet.dart';
import '../widget/home/statisticscard.dart';
import '../widget/profile/editprofiledialog.dart';
import '../widget/profile/prfilefriends.dart';
import '../widget/profile/profilecard.dart';
import '../widget/profile/profiletop.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;
    MyServices myServices = Get.put(MyServices());
    final ProfileController profilesController = Get.put(ProfileController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.grey,
      body: Container(
        padding: isLaptopScreen == true ? EdgeInsets.only(left: 120) : null,
        child: Stack(
          children: [
            Container(
              color: AppColor.grey,
              // child: Switch(value: true, onChanged: (value) {}),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 0),
            //   child: Container(
            //     margin: EdgeInsets.only(top: 0, bottom: 0),
            //     height: double.infinity,
            //     decoration: const BoxDecoration(
            //         color: AppColor.grey,
            //         borderRadius: BorderRadius.only(
            //             bottomLeft: Radius.circular(60),
            //             bottomRight: Radius.circular(20))),
            //     child: ProfileCard(),
            //   ),
            // ),
            Container(
              height: 350,
              decoration: const BoxDecoration(
                color: AppColor.primaryColor,
                image: DecorationImage(
                  image: AssetImage(AppImageAsset.mosque),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      profilesController.setDetails();
                      Get.dialog(EditProfile());
                    },
                    child: const Padding(
                        padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                        child: Icon(Icons.settings,
                            size: 30, color: AppColor.grey)),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 270,
              left: 20,
              right: 20,
              child: Stack(
                children: [
                  Obx(() => Container(
                      height: 230,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 65),
                          Text(
                            profilesController.userName.value,
                            style: GoogleFonts.patrickHand(
                                //fontWeight: FontWeight.w500,
                                color: AppColor.primaryColor,
                                fontSize: 30),
                          ),

                          SizedBox(height: 5),
                          Text("Joined : ${profilesController.joinDate}",
                              style: TextStyle(fontSize: 12)),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "(" +
                                    profilesController.userGender.value +
                                    ", " +
                                    profilesController.userAge.value +
                                    ")",
                                style: const TextStyle(
                                    fontSize: 12, color: AppColor.primaryColor),
                              ),
                            ],
                          ),

                          // ProfileTop(),
                        ],
                      ))),
                ],
              ),
            ),
            Positioned(
              top: 150,
              left: width / 4,
              right: width / 4,
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Obx(() => CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage(profilesController.img.value),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 3,
                          ),
                        ),
                      ),
                    )),
              ),
            ),
            Positioned(
              top: 510,
              right: width / 10,
              left: width / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "هل تريد تفعيل وضع الطّفل؟",
                    style: TextStyle(color: Colors.black),
                  ),
                  Obx(() => Container(
                        // color: AppColor.grey,r
                        child: Switch(
                            dragStartBehavior: DragStartBehavior.start,
                            value: profilesController.childMode.value,
                            activeColor: AppColor.thickYellow,
                            onChanged: (value) {
                              profilesController.childMode.value = value;
                            }),
                      )),
                ],
              ),
            ),
            // Positioned(
            //   top: 270,
            //   right: 220,
            //   child: Container(
            //       decoration: BoxDecoration(
            //           color: Colors.transparent,
            //           borderRadius: BorderRadius.circular(15)),
            //       width: 65,
            //       height: 65,
            //       padding: const EdgeInsets.all(12),
            //       child: Image.asset(
            //         "assets/images/planpadge.png",
            //       )),
            // ),
          ],
        ),
      ),
    );
  }
}
