//import 'dart:io';


import 'dart:io';

import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/services/auth_services.dart';
import '../../../core/services/services.dart';
import 'package:path_provider/path_provider.dart';

    SignUpControllerImp controller = Get.put(SignUpControllerImp());

class CustomButtomSheet extends StatelessWidget {
  File?pickedFile;
  final ImagePicker _picker = ImagePicker();
 CustomButtomSheet({
  Key?key,
 }): super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.put(MyServices());
    Size size=MediaQuery.of(context).size;
    
    return Container(
      width:MediaQuery.of(context).size.width,
      height:150,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      //height: size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Text("19".tr,
          style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height:30),
           Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: InkWell(
                  onTap: (){
                    takephoto(ImageSource.gallery);
                  },
                  child: Column(
                    children: [
                       const Icon(
                         Icons.image,
                         color: AppColor.primaryColor
                
                       ),
                       const SizedBox(height:5),
                       Text(
                        "20".tr,
                         style: Theme.of(context).textTheme.headlineSmall,
                       )
                  
                    ],
                  ),
                ),
              ),
              const SizedBox(width:70),
              InkWell(
                onTap: (){
                    print('Camera icon tapped!');

                    takephoto(ImageSource.camera);
                },
                child: Column(
                  children: [
                     const Icon(
                      Icons.camera,
                      color: AppColor.primaryColor
                     ),
                     const SizedBox(height:5),
                     Text(
                      "21".tr,
                       style: Theme.of(context).textTheme.headlineSmall,
                     )
                
                  ],
                ),
              ),
 
            ],
          )
          
        ],
      ),
    );
  }
 Future<void> takephoto(ImageSource source) async {
    print('Taking photo...');
    try {
      final pickedImg = await _picker.getImage(
        source: source,
        imageQuality: 100,
      );
      if (pickedImg != null) {
        pickedFile = File(pickedImg.path);
        controller.profileImageSet(pickedFile!); 

        Get.back();
      } else {
        controller.loadDefaultProfileImg();
      }
    } catch (e) {
      print('Error taking photo: $e');
    }
  }

  
}

