import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

class ChatDialog extends StatelessWidget {
  ChatDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(226, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [Text("Chat...")],
        ),
      ),
    );
  }
}
