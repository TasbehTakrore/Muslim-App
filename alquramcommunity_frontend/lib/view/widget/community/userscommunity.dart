import 'package:alquramcommunity_frontend/controller/commnity_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/plan_controller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../data/model/backend_to_front_models/specificUder_Model.dart';
import '../../screen/auth/signup.dart';
import '../../screen/otherProfile.dart';

class UsersCommunity extends StatelessWidget {
  const UsersCommunity({
    super.key,
    required this.communityID,
  });
  final int communityID;
  // final Rx<bool> checkValue;
  // final Rx<bool> visibleValue;
  // final String partialCardData;
  // final void Function(bool?) onChange;
  @override
  Widget build(BuildContext context) {
    Get.put(CommunitityController());

    return GetBuilder<CommunitityController>(
        builder: (controller) => Container(
            height: 90,
            width: 800,
            child: FutureBuilder<List<UserModel>>(
              future: controller.getAllCommunityMembers(communityID),
              builder: (BuildContext context,
                  AsyncSnapshot<List<UserModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text('حدث خطأ في الاستعلام عن قاعدة البيانات'));
                } else {
                  if (snapshot.hasData && snapshot.data != null) {
                    print("snapshot.data:  ${snapshot.data}");
                    return ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 6),
                        itemCount: snapshot.data!.length, ////
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Rx<bool> vs = true.obs;

                          return snapshot.data![index].userEmail !=
                                  controller.getUserEmail()
                              ? Visibility(
                                  visible: vs.value,
                                  child: InkWell(
                                    onTap: () {
                                      Get.dialog(Dialog.fullscreen(
                                          child: OtherProfileScreen(
                                              userName: snapshot
                                                  .data![index].userName,
                                              gender: snapshot
                                                  .data![index].userGender,
                                              age: snapshot.data![index].userAge
                                                  .toString(),
                                              userProfileImage: snapshot
                                                  .data![index].imageUrl)));
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: NetworkImage(
                                              '${authservices.uri2}/AlQuranCommunity_BackEnd/images/${snapshot.data![index].imageUrl}'),
                                          backgroundColor: Colors.transparent,
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                width: 3,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${snapshot.data![index].userName.split(' ')[0]}",
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox();
                        });
                    // return Text("");
                  } else {
                    return const Center(child: Text('لا توجد بيانات'));
                  }
                }
              },
            )));
  }
}

// Visibility(
//       visible: visibleValue.value,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 50.0, right: 50.0),
//         child: Row(
//           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Checkbox(
//               activeColor: AppColor.primaryColor,
//               value: checkValue.value,
//               onChanged: onChange,
//             ),
//             Text(partialCardData),
//           ],
//         ),
//       ),
//     )

// import 'package:flutter/Material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../core/constant/color.dart';
// import 'usercommunitysettings.dart';

// class UsersCommunity extends StatelessWidget {
//   const UsersCommunity({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //color: AppColor.lightYellow,
//       height: 120,
//       child:
//
// ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext b, i) {
//             return Column(
//               children: [
//                 InkWell(
//                   onLongPress: () {
//                     showDialog(
//                         context: context,
//                         builder: (BuildContext b) {
//                           return UserCommunitySettings();
//                         });
//                   },
//                   child: Container(
//                     width: 80,
//                     height: 80,
//                     clipBehavior: Clip.antiAlias,
//                     decoration: const BoxDecoration(shape: BoxShape.circle),
//                     child: Image.asset("assets/images/user.png",
//                         fit: BoxFit.fitWidth),
//                   ),
//                 ),
//                 Text(
//                   "Tasbeh Tak",
//                   style: GoogleFonts.patrickHand(
//                       //fontWeight: FontWeight.w500,
//                       color: AppColor.primaryColor,
//                       fontSize: 13),
//                 ),
//                 Text(
//                   "50%",
//                   style: GoogleFonts.patrickHand(
//                       //fontWeight: FontWeight.w500,
//                       color: Color.fromARGB(255, 67, 83, 77),
//                       fontSize: 12),
//                 )
//               ],
//             );
//           },
//           separatorBuilder: (BuildContext b, i) {
//             return SizedBox(width: 5);
//           },
//           itemCount: 14),
//     );
//   }
// }
