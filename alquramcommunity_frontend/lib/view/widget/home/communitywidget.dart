import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/constants.dart';
import '../community/specificcommunity.dart';

class CommunityW extends StatelessWidget {
  final String communityName;
  final String communityChatID;
  final String communityDateCreate;
  final int communityID;
  final bool isAdmin;
  final String communityAnnouncement;
  const CommunityW(
      {super.key,
      required this.communityChatID,
      required this.communityName,
      required this.communityDateCreate,
      required this.communityID,
      required this.isAdmin, required this.communityAnnouncement});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;

    return InkWell(
      onTap: () {
        print("communityChatID: $communityChatID");

        print("communityName: -- $communityName");
        Get.dialog(SpecificCommunity(
          communityAnnouncement: communityAnnouncement,
          communityChatID: communityChatID,
          communityID: communityID,
          communityName: communityName,
          communityDateCreate: communityDateCreate,
          isAdmin: isAdmin,
        ));
        // Get.toNamed(AppRoute.specificCommunity);
      },
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 12, 12),
        child: Container(
          width: 230,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x34090F13),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: isLaptopScreen == true ? 150 : 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/tasbehBorderTop.png'),
                        fit: BoxFit.cover,
                        opacity: isLaptopScreen == false ? 0.05 : 0.08),
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(156, 255, 255, 255),
                                borderRadius: BorderRadius.circular(12)),
                            alignment: AlignmentDirectional(0, 0),
                            child: const Icon(Icons.people_alt_sharp,
                                color: Colors.white, size: 20)),
                        Text(
                          communityName,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                // Container(
                //   width: 150,
                //   child: Stack(
                //     alignment: AlignmentDirectional(-1, 0),
                //     children: [
                //     Align(
                //       alignment: AlignmentDirectional(-0.91, 0),
                //       child: Container(
                //         width: 28,
                //         height: 28,
                //         clipBehavior: Clip.antiAlias,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //         ),
                //         child: Image.asset(
                //           'https://images.unsplash.com/photo-1610737241336-371badac3b66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                //           fit: BoxFit.fitWidth,
                //         ),
                //       ),
                //     ),
                //     Align(
                //       alignment: AlignmentDirectional(-0.62, 0),
                //       child: Container(
                //         width: 28,
                //         height: 28,
                //         clipBehavior: Clip.antiAlias,
                //         decoration:
                //             BoxDecoration(shape: BoxShape.circle),
                //         //   child: Image.network(
                //         //       'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                //         //       fit: BoxFit.fitWidth),
                //       ),
                //     ),
                //   ],
                // ),
                // ),
                // const Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                //   child: Text('30%'),
                // ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 0, 8),
                //   child: LinearPercentIndicator(
                //     percent: 0.3,
                //     width: 210,
                //     lineHeight: 16,
                //     animation: true,
                //     progressColor: AppColor.primaryColor,
                //     backgroundColor: Color(0xFFE0E3E7),
                //     barRadius: Radius.circular(12),
                //     padding: EdgeInsets.zero,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
