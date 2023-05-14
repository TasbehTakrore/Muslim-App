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
  const CommDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CommunitityController());
    RatingController ratingController = Get.put(RatingController());

    return GetBuilder<CommunitityController>(
      builder: (controller) {
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
                const Text(
                  "رفقة القرآن - المشرفة أسيل",
                  style: TextStyle(
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
                    Row(
                      children: const [
                        Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 20,
                        ),
                        Text("20",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.date_range, color: Colors.grey, size: 18),
                        Text("4-5-2023",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // RatingBars(
                //   initialRating: ratingController.ratingValue,
                //   onRatingUpdate: (rating) {
                //     ratingController.onRatingUpdate(rating);
                //   },
                // ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(height: 15),
                const AboutPlan(
                    description:
                        "هذه المجموعة لتسهيل التواصل بين طلبة ملتقى القرآن الكريم في جامعة النجاح ممن يتابع مع المشرفة أسيل في حلقتها الخاصّة بالحفظ."),
                const SizedBox(height: 30),
                Obx(
                  () => CustomButton(
                    textbutton: controller.buttonTxt.value,
                    onPressed: () {
                      AwesomeDialog(
                              context: Get.context!,
                              dialogType: controller.rqFLag.value == false
                                  ? DialogType.success
                                  : DialogType.warning,
                              title: controller.rqFLag.value == false
                                  ? 'Request Sended Successfully'
                                  : 'Request Canceled')
                          .show();
                      controller.buttonText();
                    },
                    color: AppColor.primaryColor,
                  ),
                )
              ],
            )));
      },
    );
  }
}
