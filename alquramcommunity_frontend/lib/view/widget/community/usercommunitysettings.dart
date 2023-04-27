import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import '../custombuttomlang.dart';

class UserCommunitySettings extends StatelessWidget {
  UserCommunitySettings({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Container(
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child:
                  Image.asset("assets/images/user.png", fit: BoxFit.fitWidth),
            ),
            Text(
              "Tasbeh Takrore",
              style: GoogleFonts.patrickHand(
                  //fontWeight: FontWeight.w500,
                  color: AppColor.primaryColor,
                  fontSize: 28),
            ),
            Text(
              "Since March/2022",
              style: GoogleFonts.patrickHand(
                  //fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 15),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColor.secondaryColor)),
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                label: const Text("ٌReminder")),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {},
                icon: const Icon(Icons.block),
                label: const Text("Block       "))
          ],
        ),
      ),
    );
  }
}
