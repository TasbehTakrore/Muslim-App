import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/custombuttomlang.dart';
import '../widget/customlogoForLang.dart';
import '../widget/logowidget.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // color: Colors.amber,
                padding: const EdgeInsets.only(top: 2, left: 10),
                height: 160,
                width: 160,
                child:
                    Image.asset(AppImageAsset.mosqueLine, fit: BoxFit.contain),
              ),
              const SizedBox(height: 55),
              Text("1".tr, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 10),
              CustomButton(
                  textbutton: "AR",
                  color: AppColor.primaryColor,
                  onPressed: () {
                    controller.changeLang("ar");
                    Get.toNamed(AppRoute.login);
                  }),
              CustomButton(
                  color: AppColor.primaryColor,
                  textbutton: "EN",
                  onPressed: () {
                    controller.changeLang("en");
                    Get.toNamed(AppRoute.login);
                  })
            ],
          )),
    );
  }
}
