import 'package:alquramcommunity_frontend/controller/auth/signup_controller.dart';
import 'package:alquramcommunity_frontend/core/services/auth_services.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/bottomsheet.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/customtextformauth.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/profileimg.dart';
import 'package:alquramcommunity_frontend/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/custombuttomlang.dart';

final AuthServices authservices = AuthServices();

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    void signUpUser() {
      authservices.signUpUser(
          context: context,
          userName: controller.name.text,
          userEmail: controller.email.text,
          userAge: int.parse(controller.age.text),
          userPassword: controller.password.text);
      print(signUpUser);
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
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: ListView(children: [
        const SizedBox(height: 25),
        /*
        CustomTextTitleAuth(
          text: "4".tr,
        ),
        const SizedBox(height: 10),
        CustomTextBodyAuth(text: "3".tr),
        const SizedBox(height: 25),
        */
        ProfileImg(onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (Builder) => CustomButtomSheet(),
          );
        }),
        const SizedBox(height: 15),
        //name
        CustomTextFormAuth(
          labelText: "15".tr,
          hinttext: "13".tr,
          iconData: Icons.person,
          mycontroller: controller.name,
          //my controller
        ),
        //email
        CustomTextFormAuth(
          labelText: "5".tr,
          hinttext: "7".tr,
          iconData: Icons.email_outlined,
          mycontroller: controller.email,
          //my controller
        ),
        //age
        CustomTextFormAuth(
          labelText: "16".tr,
          hinttext: "14".tr,
          iconData: Icons.date_range,
          mycontroller: controller.age,
          //my controller
        ),
        //password
        CustomTextFormAuth(
          labelText: "6".tr,
          hinttext: "8".tr,
          iconData: Icons.lock_outline,
          mycontroller: controller.password,
          //my controller
        ),
        const SizedBox(height: 10),
        CustomButton(
          textbutton: "12".tr,
          onPressed: () {
            signUpUser();
            print("aa");
            Get.toNamed(AppRoute.home);
          },
          color: AppColor.primaryColor,
        ),
        const SizedBox(height: 20),
        CustomTextSignUpIn(
            text: "17".tr,
            text_signup: "18".tr,
            onTap: () {
              controller.ToSignIn();
            }),
      ]),
    ));
  }
}
