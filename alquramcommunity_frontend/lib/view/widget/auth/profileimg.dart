import 'dart:io';

import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/services/services.dart';

class ProfileImg extends StatelessWidget {
  final void Function()? onTap;
  const ProfileImg({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
        SignUpControllerImp controller = Get.put(SignUpControllerImp());

    return Center(
      child: Stack(
        children: [
          Obx(() => CircleAvatar(
          radius: 80,
          backgroundImage: controller.isProfileImgPathSet.value == true
              ? FileImage(File(controller.profileImg.value.path)) as ImageProvider
              : AssetImage(AppImageAsset.profile),
          )),
          Positioned(
              bottom: 10,
              right: 15,
              child: InkWell(
                onTap: onTap,
                child: const Icon(
                  Icons.camera_alt,
                  color: AppColor.secondaryColor,
                  size: 30,
                ),
              ))
        ],
      ),
    );
  }
}
