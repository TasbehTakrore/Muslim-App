import 'package:alquramcommunity_frontend/controller/commnity_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/plan_controller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../data/model/backend_to_front_models/specificUder_Model.dart';
import '../../screen/auth/signup.dart';
import '../../screen/otherProfile.dart';

class memberRequestList extends StatelessWidget {
  const memberRequestList({
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
            height: 350,
            width: 300,
            child: FutureBuilder<List<UserModel>>(
              future: controller.getMemberRequests(communityID),
              builder: (BuildContext context,
                  AsyncSnapshot<List<UserModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text('حدث خطأ في الاستعلام عن قاعدة البيانات'));
                } else {
                  if (snapshot.hasData && snapshot.data != null) {
                    print(
                        "snapshot.data*************************:  ${snapshot.data}");
                    return ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 2),
                        itemCount: snapshot.data!.length, ////
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          Rx<bool> vs = true.obs;
                          return Visibility(
                            visible: vs.value,
                            child: InkWell(
                              onTap: () {
                                Get.dialog(Dialog.fullscreen(
                                    child: OtherProfileScreen(
                                        userEmail:
                                            snapshot.data![index].userEmail,
                                        userName:
                                            snapshot.data![index].userName,
                                        gender:
                                            snapshot.data![index].userGender,
                                        age: snapshot.data![index].userAge
                                            .toString(),
                                        userProfileImage:
                                            snapshot.data![index].imageUrl)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.lightYellow,
                                    borderRadius: BorderRadius.circular(15)),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        '${authservices.uri2}/AlQuranCommunity_BackEnd/images/${snapshot.data![index].imageUrl}'),
                                    backgroundColor: Colors.transparent,
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    print("hiii");
                                    Get.dialog(Dialog.fullscreen(
                                        child: OtherProfileScreen(
                                            userEmail:
                                                snapshot.data![index].userEmail,
                                            userName:
                                                snapshot.data![index].userName,
                                            gender: snapshot
                                                .data![index].userGender,
                                            age: snapshot.data![index].userAge
                                                .toString(),
                                            userProfileImage: snapshot
                                                .data![index].imageUrl)));
                                  },
                                  title: Text(
                                    "${snapshot.data![index].userName}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  subtitle: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Divider(),
                                      Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                                onTap: () async {
                                                  print("accept");
                                                  vs.value = false;
                                                  await controller
                                                      .addMemberCommunity(
                                                          communityID,
                                                          false,
                                                          snapshot.data![index]
                                                              .userEmail);
                                                  // controller.updatee();
                                                  // controller.updatee();
                                                },
                                                child: const Icon(Icons.check,
                                                    size: 30,
                                                    color:
                                                        AppColor.primaryColor)),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  print("reject");
                                                  vs.value = false;
                                                  controller.updatee();
                                                  controller.deleteRequest(
                                                      communityID,
                                                      snapshot.data![index]
                                                          .userEmail);
                                                },
                                                child: const Icon(Icons.close,
                                                    size: 30,
                                                    color: Colors.red)),
                                          ]),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
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
