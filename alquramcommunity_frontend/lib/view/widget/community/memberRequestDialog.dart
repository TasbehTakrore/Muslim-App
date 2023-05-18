import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

class memberRequestDialog extends StatelessWidget {
  memberRequestDialog({super.key});
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
          children: const [Text("طلبات العُضويّة"), Divider()],
        ),
      ),
    );
  }
}
