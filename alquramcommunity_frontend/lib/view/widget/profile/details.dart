import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/profileController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileController profilesController = Get.put(ProfileController());
// <<<<<<< HEAD
//     return GetBuilder<ProfileController>(
//         builder: (_) => Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(children: [
//               Text("‣ Email: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//               SizedBox(width:10),
//               Text(
//                 profilesController.userEmail.value,
//                 style:const TextStyle (
//                   fontWeight: FontWeight.bold, fontSize: 15,
//                   color: AppColor.primaryColor),
//               ),

//             ],),
//             SizedBox(height: 10,),
//             Row(children: [
//               Text("‣ Gender: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//               SizedBox(width:10),
//               Text(
//                 profilesController.userGender.value,
//                 style:const TextStyle (
//                   fontWeight: FontWeight.bold, fontSize: 15,
//                   color: AppColor.primaryColor),
//               ),

//             ],),
//             SizedBox(height:10),
//             Row(children: [
//               Text("‣ Age: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//               SizedBox(width:10),
//               Text(
//                 profilesController.userAge.value,
//                 style:const TextStyle (
//                   fontWeight: FontWeight.bold, fontSize: 15,
//                   color: AppColor.primaryColor),
//               ),

//             ],),
// =======
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 10),
                Text(
                  profilesController.userEmail.value,
                  style: const TextStyle(
                      fontSize: 15, color: AppColor.primaryColor),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(15),
                ),
                SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(15),
                ),
              ],
            ),
// >>>>>>> main

            SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(width: 10),
            //     Text(
            //       "(" +
            //           profilesController.userGender.value +
            //           ", " +
            //           profilesController.userAge.value +
            //           ")",
            //       style: const TextStyle(
            //           fontSize: 15, color: AppColor.primaryColor),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 10),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       " Age: ",
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     SizedBox(width: 10),
            //     Text(
            //       profilesController.userAge.value,
            //       style: const TextStyle(
            //           fontSize: 15, color: AppColor.primaryColor),
            //     ),
            //   ],
            // ),
          ],

        ));
  }
}
