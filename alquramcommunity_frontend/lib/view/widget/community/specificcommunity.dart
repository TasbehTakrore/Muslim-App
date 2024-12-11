import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../controller/commnity_controller.dart';
import '../../../core/constant/routes.dart';
import '../Quran/editquranthemedialog.dart';
import 'chat.dart';
import 'customcommunitycard.dart';
import 'editcommunityplan.dart';
import 'memberRequestDialog.dart';
import 'userscommunity.dart';

class SpecificCommunity extends StatelessWidget {
  final String communityChatID;
  final int communityID;
  final String communityName;
  final String communityDateCreate;
  final bool isAdmin;
  final String communityAnnouncement;
  const SpecificCommunity(
      {super.key,
      required this.communityID,
      required this.communityName,
      required this.communityDateCreate,
      required this.isAdmin,
      required this.communityChatID,
      required this.communityAnnouncement});

  @override
  Widget build(BuildContext context) {
    late TextEditingController messageController = TextEditingController();
    // communitityController.getAnouncement(communityID);
    communitityController.stikyMessage.value = communityAnnouncement;
    print("communityChatID inside comm: : : $communityChatID");
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Get.put(CommunitityController());
    return Dialog.fullscreen(
      child: GetBuilder<CommunitityController>(builder: (controller) {
        return WillPopScope(
            onWillPop: () async {
              controller.getAllCommunities();
              Get.offAllNamed(AppRoute.home);
              return false;
            },
            child: Scaffold(
                // floatingActionButton: Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     isAdmin == true
                //         ? FloatingActionButton(
                //             heroTag: "setting",
                //             backgroundColor: AppColor.thickYellow,
                //             child: const Icon(Icons.settings),
                //             onPressed: () {
                //               showDialog(
                //                   context: context,
                //                   builder: (BuildContext b) {
                //                     return EditCommunityPlan();
                //                   });
                //             })
                //         : SizedBox(),
                //     const SizedBox(height: 5),
                //     FloatingActionButton(
                //         heroTag: "chat",
                //         backgroundColor: AppColor.primaryColor,
                //         child: const Icon(Icons.chat),
                //         onPressed: () {
                //           showDialog(
                //               context: context,
                //               builder: (BuildContext b) {
                //                 return ChatDialog(
                //                     communityName: communityName,
                //                     communityChatID: communityChatID);
                //               });
                //         }),
                //   ],
                // ),
                // floatingActionButtonLocation:
                //     FloatingActionButtonLocation.endFloat,
                backgroundColor: AppColor.grey,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Text(
                        communityName,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.patrickHand(
                            //fontWeight: FontWeight.w500,
                            color: AppColor.primaryColor,
                            fontSize: 30),
                      ),
                      Text(
                        "منذُ  $communityDateCreate",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.patrickHand(
                            //fontWeight: FontWeight.w500,
                            color: AppColor.primaryColor,
                            fontSize: 15),
                      ),
                      CustomCommunityCard(
                          communityID: communityID,
                          title: 'الإعلانات المُثبّتة',
                          fontSize1: 15,
                          fontSize2: 16,
                          heigh: 160,
                          body: communitityController.stikyMessage.value,
                          isAdmin: isAdmin),
                      SizedBox(height: 5),
                      UsersCommunity(communityID: communityID),
                      const SizedBox(height: 15),

                      MessageStreamBuilder(communityChatID: communityChatID),
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
                              onPressed: () {
                                if (messageController.text != "") {
                                  communitityController.sendMessage(
                                      communityChatID: communityChatID,
                                      message: messageController.text);
                                }
                                messageController.clear();
                                // communityChatID
                              },
                            ),
                            Expanded(
                              child: TextField(
                                controller: messageController,
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

                      // ChatDialog(
                      //     communityName: communityName,
                      //     communityChatID: communityChatID),
                      // Container(
                      //   height: 500,
                      //   decoration: const BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(20)),
                      //     color: AppColor.light2Yellow,
                      //   ),
                      // )
                    ],
                  ),
                )));
      }),
    );
  }
}
