import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/core/localization/changelocal.dart';
import 'package:alquramcommunity_frontend/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/language/custombuttomlang.dart';
import '../widget/logowidget.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const logoWidget(
                logowidth: 120.0,
                sizeType: 1,
              ),
              SizedBox(height: 55),
              Text("1".tr, style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 10),
              CustomButtonLang(
                  textbutton: "AR",
                  onPressed: () {
                    controller.changeLang("ar");
                    Get.toNamed(AppRoute.home);
                  }),
              CustomButtonLang(
                  textbutton: "EN",
                  onPressed: () {
                    controller.changeLang("en");
                    Get.toNamed(AppRoute.home);
                  })
            ],
          )),
    );
  }
}
