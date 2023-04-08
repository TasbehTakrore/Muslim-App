import 'package:alquramcommunity_frontend/view/widget/auth/customtextbodyauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtextformauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtexttitleauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/custombuttomlang.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: AppColor.grey_sec,

        /*
      appBar: AppBar(
        title: const Text('Sign In',style: Theme.of(context).textTheme.headline1),
        elevation: 0.0,
        centerTitle: true,
      ),*/

        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: ListView(children: [
        const SizedBox(height: 65),
        CustomTextTitleAuth(
          text: "4".tr,
        ),
        const SizedBox(height: 10),
        CustomTextBodyAuth(text: "3".tr),
        const SizedBox(height: 25),
        const LogoAuth(),
        const SizedBox(height: 15),
        CustomTextFormAuth(
          labelText: "5".tr,
          hinttext: "7".tr,
          iconData: Icons.email_outlined,
          //my controller
        ),
        CustomTextFormAuth(
          labelText: "6".tr,
          hinttext: "8".tr,
          iconData: Icons.lock_outline,
          //my controller
        ),
        Text("9".tr, textAlign: TextAlign.center),
        const SizedBox(height: 15),
        CustomButton(
          color: AppColor.primaryColor,
          textbutton: "10".tr,
          onPressed: () {
            Get.toNamed(AppRoute.home);
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("11".tr),
            InkWell(
                child: Text(
              "12".tr,
              style: const TextStyle(
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ]),
    ));
  }
}
