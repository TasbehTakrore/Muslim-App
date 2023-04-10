//import 'dart:io';


import 'dart:io';

import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class CustomButtomSheet extends StatelessWidget {
  File?pickedFile;
  final ImagePicker _picker = ImagePicker();
 CustomButtomSheet({
  Key?key,
 }): super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      width:MediaQuery.of(context).size.width,
      height:100,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      //height: size.height * 0.4,
      child: Column(
         children: [
          Text("19".tr,
          style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height:10),
           Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
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
              const SizedBox(width:70),
              InkWell(
                onTap: (){
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
final picked_img=await _picker.getImage(source:source,imageQuality:100);
//pickedFile=File(picked_img!.path as List<Object>,picked_img as String);
//pickedFile=File(picked_img!.path);
//print(pickedFile);

}
}

