import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/services/services.dart';
import '../../provider/userprovider.dart';
import '../widget/home/statisticscard.dart';
import '../widget/profile/editprofiledialog.dart';
import '../widget/profile/profilecard.dart';
import '../widget/profile/profiletop.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.put(MyServices());
    final user = Provider.of<UserProvider>(context).user;
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
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: NetworkImage(
              //       'https://img.freepik.com/free-vector/flat-arabic-pattern-background_79603-1826.jpg'),
              //   alignment: Alignment.bottomCenter,
              //   fit: BoxFit.cover,
              //   opacity: 0.2,
              // ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff266f52), Color(0xff266f52)],
              ),
            ),
            height: 170,
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
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        height: 200,
                        width: width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Text(
                              myServices.sharedPreferences
                                  .getString("user_name")
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColor.primaryColor),
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
