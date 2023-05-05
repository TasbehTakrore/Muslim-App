import 'package:alquramcommunity_frontend/controller/profileController.dart';
import 'package:alquramcommunity_frontend/view/screen/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../controller/alarmController.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../controller/prayscreen_controller.dart';
import '../../../core/constant/color.dart';
import '../auth/customtextformauth.dart';
import '../custombuttomlang.dart';
import 'package:alquramcommunity_frontend/core/services/auth_services.dart';
class EditProfile extends StatelessWidget {

  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    ProfileController profilesController=Get.put(ProfileController());
    return Dialog(
      
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child:  Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text("Edit Profile Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height:30),  
                  CustomTextFormAuth(
                    labelText: "15".tr,
                    hinttext: "13".tr,
                    iconData: Icons.person,
                    mycontroller: controller.name,
                ),
                  CustomTextFormAuth(
                    labelText: "16".tr,
                    hinttext: "14".tr,
                    iconData: Icons.date_range,
                    mycontroller: controller.age,
                    //my controller
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                    children: [
                      const Text('Gender',style: TextStyle(fontSize: 15),),
                      Obx(() => Row(
                        children: [
                          for (String gender in controller.genders)
                            Row(
                              
                              children: [
                                SizedBox(width:5),
                                Theme(
                                  data: ThemeData(
                                    focusColor:AppColor.primaryColor 
                                  ),
                                  child: Radio(
                                    value: gender,
                                    groupValue: controller.selectedGender.value,
                                    onChanged: (value) {
                                    controller.selectedGender.value = value!;
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
                  const SizedBox(height: 10),
                //password
                  CustomTextFormAuth(
                    labelText: "6".tr,
                    hinttext: "Enter Paaword",
                    iconData: Icons.lock_outline,
                    mycontroller: controller.password,
                    obscureText:true
                    //my controller
                  ),
                  SizedBox(height: 10,),
                  CustomButton(
                    textbutton: "Update",
                    onPressed: () {
                       if(controller.password.text=='') return;
                       Get.dialog(Dialog(
                        child: SingleChildScrollView(
                          child: Container(
                            height:250,
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                             ),
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                Text("Are you sure want to update your information?\n Please inter your password if you're",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.primaryColor
                                ),
                                ),
                                CustomTextFormAuth(
                                labelText: "6".tr,
                                hinttext: "Enter old Paaword",
                                iconData: Icons.lock_outline,
                                mycontroller: controller.checkPassword,
                                obscureText:true
                                //my controller
                              ),
                              CustomButton(
                                textbutton: "Confirm",
                                onPressed: () {
                                   profilesController.updateDetails();
                                   profilesController.userInformation();
                                   profilesController.clearFields();
                                   Get.back();
                               
                                },
                                color: AppColor.primaryColor,
                              )
                            
                                ]
                              ),
                            ),
                        ),
                        ),
                       );
                    },
                    color: AppColor.primaryColor,
                  ),
                  
            
                      ],
                
            ),
          ),
        ),
      ),
    );
  }
}
