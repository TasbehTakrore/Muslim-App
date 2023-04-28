import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class ProfileImg extends StatelessWidget {
  final void Function()? onTap;
  const ProfileImg({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(AppImageAsset.profile),
          ),
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
