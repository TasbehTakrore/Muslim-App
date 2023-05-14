import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/view/widget/community/communitydetailts.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../../controller/allcommunities_controller.dart';
import '../../../controller/commnity_controller.dart';
import '../../../controller/specificCommunity_controller.dart';
import '../../../core/constant/routes.dart';
import '../home/customappbar.dart';
import 'createNewCommunityDialog.dart';

class AllCommunities extends StatelessWidget {
  const AllCommunities({super.key});

  @override
  Widget build(BuildContext context) {
    CommunitityController communitityController =
        Get.put(CommunitityController());

    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoute.home);
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
                shadowColor: AppColor.grey,
                automaticallyImplyLeading: false,
                //primary: true,
                elevation: 0.0,
                backgroundColor: AppColor.grey,
                title: CustomAppBar(onPressedIcon: () {})
                //titleTextStyle: TextStyle(text),
                ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          hintText: "Search",
                          suffixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return createNewCommunityDialog();
                                });
                          },
                        )
                      ],
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: communitityController.communities.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.dialog(CommDetailsDialog());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.lightYellow,
                                borderRadius: BorderRadius.circular(15)),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    AssetImage(AppImageAsset.profile),
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
                              title: Text(communitityController
                                  .communities[index].communityName),
                              subtitle: Text(
                                  communitityController
                                      .communities[index].communityDescription,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1),
                            ),
                          ),
                        );
                      },
                    ))
                  ],
                ))));
  }
}
