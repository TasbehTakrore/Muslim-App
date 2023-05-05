import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController{
  Login();
  ToSignUp();
  ToForgetPassword();
}

class LoginControllerImp extends LoginController{
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpass=false;

  void showPassword(){
    isshowpass= isshowpass==true?false:true;
    update();
  }

  @override
  Login() {
 
  }

  @override
  ToSignUp() {
  
    Get.toNamed(AppRoute.signup);
  }
  @override
  void onInit() {
    email = TextEditingController();
    password= TextEditingController();
    email.text='';
    password.text='';
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  
  @override
  ToForgetPassword() {
     Get.toNamed(AppRoute.forgetPassword);
  }

}