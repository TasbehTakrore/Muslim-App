import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ChatAppBar extends StatelessWidget {
  // final String communityName;
  const ChatAppBar({super.key, });

  @override
  Widget build(BuildContext context) {
    return  AppBar(
            backgroundColor: AppColor.primaryColor,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("communityName"),
                SizedBox(width: 10),
                // Image.asset(
                //   AppImageAsset.mosqueLine,
                //   fit: BoxFit.contain,
                //   height: 80,
                //   width: 80,
                // ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close),
              )
            ],
          );
  }
}