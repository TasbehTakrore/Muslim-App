import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
  ToRecievedCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{

  late TextEditingController email;


  @override
  checkEmail() {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  
  @override
  ToRecievedCode() {
       // Get.toNamed(AppRoute.recievedCode);

 
  }
  


}