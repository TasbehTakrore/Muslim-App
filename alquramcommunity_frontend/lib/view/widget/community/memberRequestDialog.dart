import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';
import 'memberRequestList.dart';

class memberRequestDialog extends StatelessWidget {
  final int communityID;

  memberRequestDialog({super.key, required this.communityID});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Color.fromARGB(200, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Container(
        height: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("طلبات العُضويّة"),
            Divider(),
            memberRequestList(communityID: communityID)
          ],
        ),
      ),
    );
  }
}
