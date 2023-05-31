import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

class ChatDialog extends StatelessWidget {
  final String communityName;
  ChatDialog({super.key, required this.communityName});
  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
        backgroundColor: Color.fromARGB(226, 255, 255, 255),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(communityName),
                SizedBox(width: 10),
                // Image.asset(
                //   AppImageAsset.mosqueLine,
                //   fit: BoxFit.contain,
                //   height: 80,
                //   width: 80,
                // ),
              ],
            ),
          ),

          //chatAppBar(),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColor.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: AppColor.secondaryColor,
                          textDirection: TextDirection.ltr,
                        ),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            hintText: 'اكتب رسالتك هنا...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )

        // Container(
        // width: MediaQuery.of(context).size.width,
        // child: Column(
        //   //mainAxisSize: MainAxisSize.min,
        //   children: [Text("Chat...")],
        // ),
        //  ),
        );
  }
}
