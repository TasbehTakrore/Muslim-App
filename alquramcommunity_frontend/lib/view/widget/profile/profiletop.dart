import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/profileController.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class ProfileTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// <<<<<<< HEAD
//     return GetBuilder<ProfileController>(builder: (controller) {

//     return
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),

//             child: Row(
//               mainAxisAlignment:MainAxisAlignment.center,
//               children: [
//                   Container(
//                   decoration: BoxDecoration(
//                       color: AppColor.lightYellow,
//                       borderRadius: BorderRadius.circular(15)),
//                   width: 65,
//                   height: 65,
//                   padding: const EdgeInsets.all(12),
//                   child:  Image.asset("assets/images/planpadge.png",
//                   )),
//                   SizedBox(width:20),
//                    Container(
//                   decoration: BoxDecoration(
//                       color: AppColor.lightYellow,
//                       borderRadius: BorderRadius.circular(15)),
//                   width: 65,
//                   height: 65,
//                   padding: const EdgeInsets.all(12),
//                   child:  SvgPicture.asset(AppImageAsset.commBadge,
//                   )),

//               ],
//             ),
//           );

//     });
// =======
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              width: 65,
              height: 65,
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                "assets/images/planpadge.png",
              )),
          SizedBox(width: 12),
          // Container(
          //     decoration: BoxDecoration(
          //         color: Colors.white, borderRadius: BorderRadius.circular(15)),
          //     width: 65,
          //     height: 65,
          //     padding: const EdgeInsets.all(12),
          //     child: SvgPicture.asset(
          //       AppImageAsset.commBadge,
          //     )),
        ],
      ),
    );
// >>>>>>> main
  }
}
