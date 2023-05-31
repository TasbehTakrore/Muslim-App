import 'package:alquramcommunity_frontend/controller/homescreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:get/get.dart';
import '../../../controller/commnity_controller.dart';
import '../../../core/constant/constants.dart';
import '../../../data/model/backend_to_front_models/community_model.dart';
import 'communitywidget.dart';
import 'joincommunity.dart';

class ListCommunities extends StatelessWidget {
  const ListCommunities({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;

    CommunitityController communitityController =
        Get.put(CommunitityController());
    HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
    return Container(
        height: isLaptopScreen == true ? 260 : 205,
        child: FutureBuilder<List<String>>(
          future: homeScreenControllerImp.getMyCommu(),
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text('حدث خطأ في الاستعلام عن قاعدة البيانات'));
            } else {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 2),
                    itemCount:
                        homeScreenControllerImp.myCommunities.length + 1, ////
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      print(
                          " homeScreenControllerImp.myCommunities.length:: ${homeScreenControllerImp.myCommunities.length}");
                      if (index <
                          homeScreenControllerImp.myCommunities.length) {
                        Community desiredCommunity =
                            communitityController.communities.firstWhere(
                          (community) =>
                              community.id ==
                              int.parse(
                                  homeScreenControllerImp.myCommunities[index]),
                        );
                        print(
                            "desiredCommunity : ${desiredCommunity.createdAt}");
                        String formattedDate = DateFormat('d-M-yyyy')
                            .format(desiredCommunity.createdAt);
                        print("formattedDate: $formattedDate");

                        return CommunityW(
                          communityChatID: desiredCommunity.communityChatID,
                          communityName: desiredCommunity.communityName,
                          communityDateCreate: formattedDate,
                          communityID: int.parse(
                              homeScreenControllerImp.myCommunities[index]),
                          isAdmin: desiredCommunity.adminEmail ==
                                  homeScreenControllerImp.userEmail
                              ? true
                              : false,
                        );
                      } else {
                        return const JoinCommunity();
                      }
                    });
                // return Text("");
              } else {
                return const Center(child: Text('لا توجد بيانات'));
              }
            }
          },
        ));

    // return ListView.builder(
    //   itemCount: snapshot.data!.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Text(snapshot.data![index]);
    //   },
    // );

    // Container(
    //       height: 205,
    //       child: ListView.separated(
    //           separatorBuilder: (context, index) => const SizedBox(width: 2),
    //           itemCount: homeScreenControllerImp.myCommunities.length + 1, ////
    //           scrollDirection: Axis.horizontal,
    //           itemBuilder: (context, index) {
    //             if (index < homeScreenControllerImp.myCommunities.length) {
    //               return const Community(communityName: ".."
    //                   // communitityController.communities[index]

    //                   );
    //             } else {
    //               return const JoinCommunity();
    //             }
    //           }));

    // return ListView.builder(
    //   itemCount: snapshot.data!.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Text(snapshot.data![index]);
    //   },
    // );
  }
}
