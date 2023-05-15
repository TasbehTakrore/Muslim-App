import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/commnity_controller.dart';
import '../../../core/constant/color.dart';
import '../auth/customtextformauth.dart';
import 'customText.dart';

class createNewCommunityDialog extends StatelessWidget {
  const createNewCommunityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    CommunitityController communitityController =
        Get.put(CommunitityController());

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("أنشِئ مجتمعًا جديدًا!"),
            Divider(),
            CustomText(
              labelText: "اسم المُجتمع",
              hinttext: "أدخل اسم المجتمع",
              iconData: Icons.person,
              mycontroller: communitityController.communityNameController,
              //my controller
            ),
            CustomText(
              labelText: "وصف المُجتمع",
              hinttext: "أدخل وصفًا قصيرًا لمجتمعك",
              iconData: Icons.text_fields_outlined,
              mycontroller:
                  communitityController.communityDescriptionController,
              //my controller
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'الجنس',
                  style: TextStyle(fontSize: 15),
                ),
                Obx(() => Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (String gender in communitityController.genders)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Theme(
                                data: ThemeData(
                                    focusColor: AppColor.primaryColor),
                                child: Radio(
                                  value: gender,
                                  groupValue: communitityController
                                      .selectedGender.value,
                                  onChanged: (value) {
                                    communitityController.selectedGender.value =
                                        value!;
                                  },
                                ),
                              ),
                              Text(gender.capitalizeFirst!),
                            ],
                          ),
                      ],
                    )),
              ],
            ),
            Container(
              width: 300,
              child: EasyElevatedButton(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  label: "إنشاء",
                  isRounded: true,
                  labelStyle: Theme.of(context).textTheme.bodyLarge,
                  //height: ,
                  labelColor: AppColor.grey,
                  color: AppColor.primaryColor,
                  onPressed: () {
                    communitityController.createNewCommunity();
                    
                    // trainerScreenController.testType();
                    Get.toNamed(AppRoute.SpecificCommunity);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
