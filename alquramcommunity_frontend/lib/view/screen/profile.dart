import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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

class ProfileScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
     MyServices myServices = Get.put(MyServices());
     final ProfileController profilesController =
        Get.put(ProfileController());
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
              margin: EdgeInsets.only(top: 0, bottom: 0),
              height: double.infinity,
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
                    profilesController.setDetails();
                    Get.dialog(EditProfile());
                  },
                  child:const  Padding(
                      padding: EdgeInsets.only(top: 10,right:5),
                      child:
                          Icon(Icons.settings, size: 30, color: AppColor.grey)),
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
                Obx(() => 
                
                Container(
                    height: 200,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                       color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          profilesController.userName.value,
                          style:const TextStyle (
                              fontWeight: FontWeight.bold, fontSize: 20,
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(height: 5),
                        Text("Joined : ${profilesController.joinDate}",
                            style: TextStyle(fontSize: 12)),
                        SizedBox(height: 20),
                        ProfileTop(),
                      ],
                    ))),
              ],
            ),
          ),
          Positioned(
            top:-20,
            left: width / 4,
            right: width / 4,
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child:  
              Obx(() => CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(profilesController.img.value),
                  child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.black,
                      width: 3,
                  ),),),
        
          )),
          ),
          )
        ],
      ),
    );
  }
}
