import 'package:alquramcommunity_frontend/controller/profileController.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/view/screen/auth/signup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../controller/alarmController.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';
import '../auth/customtextformauth.dart';
import '../custombuttomlang.dart';
import 'package:alquramcommunity_frontend/core/services/auth_services.dart';

MyServices myServices = Get.put(MyServices());

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    ProfileController profilesController = Get.put(ProfileController());
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          height: 505,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "تعديل معلوماتي",
                  style: GoogleFonts.patrickHand(
                      //fontWeight: FontWeight.w500,
                      color: AppColor.primaryColor,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: CustomTextFormAuth(
                    labelText: "15".tr,
                    hinttext: "13".tr,
                    iconData: Icons.person,
                    mycontroller: controller.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: CustomTextFormAuth(
                    labelText: "16".tr,
                    hinttext: "14".tr,
                    iconData: Icons.date_range,
                    mycontroller: controller.age,
                    //my controller
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'الجنس',
                        style: TextStyle(fontSize: 15),
                      ),
                      Obx(() => Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (String gender in controller.genders)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                          focusColor: AppColor.primaryColor),
                                      child: Radio(
                                        value: gender,
                                        groupValue:
                                            controller.selectedGender.value,
                                        onChanged: (value) {
                                          controller.selectedGender.value =
                                              value!;
                                        },
                                      ),
                                    ),
                                    Text(gender.capitalizeFirst!),
                                  ],
                                ),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                //password
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: CustomTextFormAuth(
                      labelText: "6".tr,
                      hinttext: "أدخل كلمة السر الجديدة",
                      iconData: Icons.lock_outline,
                      mycontroller: controller.password,
                      obscureText: true
                      //my controller
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: CustomButton(
                    textbutton: "تحديث",
                    onPressed: () {
                      if (controller.password.text == '') return;
                      Get.dialog(
                        Dialog(
                          child: SingleChildScrollView(
                            child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 80),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "هل تريد تغيير معلوماتك؟\n أدخل كلمة السرّ ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.primaryColor),
                                    ),
                                    CustomTextFormAuth(
                                        labelText: "6".tr,
                                        hinttext: "أدخل كلمة السرّ القديمة",
                                        iconData: Icons.lock_outline,
                                        mycontroller: controller.checkPassword,
                                        obscureText: true
                                        //my controller
                                        ),
                                    CustomButton(
                                      textbutton: "تأكيد",
                                      onPressed: () {
                                        profilesController.updateDetails();
                                        profilesController.userInformation();
                                        profilesController.clearFields();
                                        Get.back();
                                      },
                                      color: AppColor.primaryColor,
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      );
                    },
                    color: AppColor.primaryColor,
                  ),
                ),
                TextButton.icon(
                    onPressed: () async {
                      print("تسجيل الخروج");
                      // await myServices.sharedPreferences.clear();
                      FirebaseMessaging.instance
                          .unsubscribeFromTopic("planNotification");
                      controller.deletesharedPreferences();
                      Get.offAllNamed(AppRoute.login);
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.grey,
                    ),
                    label: Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
