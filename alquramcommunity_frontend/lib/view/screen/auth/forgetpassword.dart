import 'package:alquramcommunity_frontend/controller/auth/fogetpassword_controller.dart';
import 'package:alquramcommunity_frontend/controller/auth/signup_controller.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/bottomsheet.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/custombottomauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtextbodyauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtextformauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtexttitleauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/logoauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/profileimg.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/custombuttomlang.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        //  backgroundColor: AppColor.grey_sec,

        /*
      appBar: AppBar(
        title: const Text('Sign In',style: Theme.of(context).textTheme.headline1),
        elevation: 0.0,
        centerTitle: true,
      ),*/

        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: ListView(children: [
        const SizedBox(height: 25),

        CustomTextTitleAuth(
          text: "9".tr,
        ),

        const SizedBox(height: 25),
        const LogoAuth(),
        const SizedBox(height: 15),

        //email
        CustomTextFormAuth(
          labelText: "5".tr,
          hinttext: "7".tr,
          iconData: Icons.email_outlined,
          mycontroller: controller.email,
          //my controller
        ),

        const SizedBox(height: 10),
        CustomButton(
          textbutton: "22".tr,
          onPressed: () {
            Get.toNamed(AppRoute.home);
          },
          color: AppColor.primaryColor,
        ),
        const SizedBox(height: 20),
      ]),
    ));
  }
}
