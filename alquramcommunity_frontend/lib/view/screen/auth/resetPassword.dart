import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/fogetpassword_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/custombuttomlang.dart';

class ResetPassword extends StatelessWidget {
  ForgetPasswordControllerImp forgetPassword =
      Get.put(ForgetPasswordControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60.0),
            const LogoAuth(),
            SizedBox(height: 10.0),
            Text(
              'أدخل رمز التحقّق',
              style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 5; i++)
                  SizedBox(
                    width: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: AppColor.primaryColor),
                        ),
                      ),
                      onChanged: (value) {
                        forgetPassword.updatePin(i, value);
                        if (i < 4 && value.isNotEmpty) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      controller:
                          TextEditingController(text: forgetPassword.pin[i]),
                    ),
                  ),
              ],
            ),
            Divider(),
            SizedBox(height: 10.0),
            Text(
              'كلة السرّ الجديدة',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            GetBuilder<ForgetPasswordControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                labelText: "6".tr,
                hinttext: "Enter New Password",
                iconData: Icons.lock_outline,
                mycontroller: forgetPassword.newPasswordController,
                obscureText: true,
              ),
            ),
            SizedBox(height: 15.0),
            CustomButton(
              textbutton: "22".tr,
              onPressed: () {
                forgetPassword.chngPass();
              },
              color: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
