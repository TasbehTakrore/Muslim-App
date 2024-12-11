import 'dart:convert';

import 'package:alquramcommunity_frontend/controller/auth/login_controller.dart';
import 'package:alquramcommunity_frontend/view/screen/auth/signup.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtextbodyauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtextformauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtexttitleauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/logoauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/textsignup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../widget/custombuttomlang.dart';

import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
   Login({super.key});

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

        body: ProgressHUD(
            child: Builder(
                builder: (context) => Center(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
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
                            final progress = ProgressHUD.of(context);
                            progress?.show();
                            Future.delayed(Duration(seconds: 1), () {
                              progress?.dismiss();
                            });
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
                    )))));
  }
}


// body: ProgressHUD(
        // child: Builder(
        //   builder: (context) => Center(
        //     child: Column(
//               children: <Widget>[
//                 ElevatedButton(
//                   child: Text('Show for a second'),
//                   onPressed: () {
//                     final progress = ProgressHUD.of(context);
//                     progress?.show();
//                     Future.delayed(Duration(seconds: 1), () {
//                       progress?.dismiss();
//                     });
//                   },
//                 ),
//                 ElevatedButton(
//                   child: Text('Show with text'),
//                   onPressed: () {
//                     final progress = ProgressHUD.of(context);
//                     progress?.showWithText('Loading...');
//                     Future.delayed(Duration(seconds: 1), () {
//                       progress?.dismiss();
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),