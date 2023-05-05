import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/custombuttomlang.dart';
import '../widget/logowidget.dart';

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
                alignment: Alignment.center,
                color: Colors.red,
                child: logoWidget(
                  logowidth: 120.0,
                  sizeType: 1,
                ),
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
