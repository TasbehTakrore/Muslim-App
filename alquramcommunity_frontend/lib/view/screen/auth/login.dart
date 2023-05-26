import 'package:alquramcommunity_frontend/controller/auth/login_controller.dart';
import 'package:alquramcommunity_frontend/view/screen/auth/signup.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtextbodyauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtextformauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtexttitleauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/logoauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../widget/custombuttomlang.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    void signInUser() {
      authservices.signInUser(
          context: context,
          userEmail: controller.email.text,
          userPassword: controller.password.text);
    }

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
        LogoAuth(),
        const SizedBox(height: 15),
        //email
        CustomTextFormAuth(
          labelText: "5".tr,
          hinttext: "7".tr,
          iconData: Icons.email_outlined,
          mycontroller: controller.email,

          //my controller
        ),
        //password
        GetBuilder<LoginControllerImp>(
          builder: (controller) => CustomTextFormAuth(
            labelText: "6".tr,
            hinttext: "8".tr,
            iconData: Icons.lock_outline,
            mycontroller: controller.password,
            obscureText: true,
            onTapIcon: () {
              controller.showPassword();
            },

            //my controller
          ),
        ),

        //forget password
        InkWell(
          onTap: () {
            controller.ToForgetPassword();
          },
          child: Text("9".tr, textAlign: TextAlign.center),
        ),
        const SizedBox(height: 15),
        CustomButton(
          textbutton: "10".tr,
          onPressed: () {
            signInUser();
          },
          color: AppColor.primaryColor,
        ),
        const SizedBox(height: 20),
        CustomTextSignUpIn(
            text: "11".tr,
            text_signup: "12".tr,
            onTap: () {
              controller.ToSignUp();
            }),
      ]),
    ));
  }
}
