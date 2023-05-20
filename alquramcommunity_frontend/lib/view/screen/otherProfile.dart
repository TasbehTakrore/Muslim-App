import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import '../../controller/profileController.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/services/services.dart';
import '../../provider/userprovider.dart';
import '../widget/auth/bottomsheet.dart';
import '../widget/home/statisticscard.dart';
import '../widget/profile/editprofiledialog.dart';
import '../widget/profile/prfilefriends.dart';
import '../widget/profile/profilecard.dart';
import '../widget/profile/profiletop.dart';
import 'auth/signup.dart';

class OtherProfileScreen extends StatelessWidget {
  final String userName;
  // final String joinedDate;
  final String gender;
  final String age;
  final String userProfileImage;

  const OtherProfileScreen(
      {super.key,
      required this.userName,
      // required this.joinedDate,
      required this.gender,
      required this.age,
      required this.userProfileImage});
  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.put(MyServices());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColor.grey,
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
          ),
          Positioned(
            top: 275,
            left: 20,
            right: 20,
            child: Stack(
              children: [
                Container(
                    height: 200,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 65),
                        Text(
                          userName,
                          style: GoogleFonts.patrickHand(
                              //fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor,
                              fontSize: 30),
                        ),

                        SizedBox(height: 5),
                        // Text("Joined : ${joinedDate}",
                        //     style: TextStyle(fontSize: 12)),
                        // SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "(" + gender + ", " + age + ")",
                              style: const TextStyle(
                                  fontSize: 12, color: AppColor.primaryColor),
                            ),
                          ],
                        ),
                        // ProfileTop(),
                      ],
                    )),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: width / 4.5,
            right: width / 4.5,
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    '${authservices.uri2}/AlQuranCommunity_BackEnd/images/${userProfileImage}'),
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
              ),
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
    );
  }
}
