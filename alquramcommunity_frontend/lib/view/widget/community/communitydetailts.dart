import 'package:alquramcommunity_frontend/view/widget/community/aboutplan.dart';
import 'package:alquramcommunity_frontend/view/widget/community/ratingbar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../../controller/commnity_controller.dart';
import '../../../controller/rating_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../custombuttomlang.dart';

class CommDetailsDialog extends StatelessWidget {
  // int communityID;
  final int index;
  final int CommunityID;
  final String date;

  const CommDetailsDialog(
      {super.key,
      required this.index,
      required this.CommunityID,
      required this.date});

  @override
  Widget build(BuildContext context) {
    Get.put(CommunitityController());
    // RatingController ratingController = Get.put(RatingController());
    CommunitityController communitityController =
        Get.put(CommunitityController());
    return GetBuilder<CommunitityController>(
      builder: (controller) {
        Rx<String> buttonTxt = 'إرسال طلب للانضمام'.obs;
        // final lastOpenedEng = controller.getLastOpenedEng();
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: SizedBox(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage(AppImageAsset.profile),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  communitityController.communities[index].communityName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.primaryColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Row(
                    //   children: const [
                    //     Icon(
                    //       Icons.person,
                    //       color: Colors.grey,
                    //       size: 20,
                    //     ),
                    //     Text("20",
                    //         style: TextStyle(
                    //           color: Colors.grey,
                    //         )),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   width: 15,
                    // ),
                    Row(
                      children: [
                        Icon(Icons.date_range, color: Colors.grey, size: 18),
                        Text(date!,
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(height: 15),
                AboutPlan(
                    description: communitityController
                        .communities[index].communityDescription),
                const SizedBox(height: 30),
                Obx(() {
                  return CustomButton(
                    textbutton: buttonTxt.value,
                    onPressed: () {
                      if (buttonTxt.value == "إرسال طلب للانضمام") {
                        communitityController.sendRequest(CommunityID);
                        buttonTxt.value = "إلغاء طلب الانضمام";
                        // rqFLag.value = true;
                      } else {
                        buttonTxt.value = "إرسال طلب للانضمام";
                        communitityController.deleteRequest(
                            CommunityID, communitityController.getUserEmail());

                        // rqFLag.value = false;
                      }
                      print("Inside  +${buttonTxt.value}+");

                      // AwesomeDialog(
                      //         context: Get.context!,
                      //         dialogType: controller.rqFLag.value == false
                      //             ? DialogType.success
                      //             : DialogType.warning,
                      //         title: controller.rqFLag.value == false
                      //             ? 'Request Sended Successfully'
                      //             : 'Request Canceled')
                      //     .show();
                      //controller.buttonText();
                    },
                    color: AppColor.primaryColor,
                  );
                })
              ],
            )));
      },
    );
  }
}
