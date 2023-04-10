import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
  signUp();
  ToSignIn();
}

class SignUpControllerImp extends SignUpController{
  final AuthServices authServices =AuthServices();
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController age;
  late TextEditingController password;



  @override
  signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password= TextEditingController();
    name= TextEditingController();
    age= TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    age.dispose();
    super.dispose();
  }
  
  @override
  ToSignIn() {
        Get.toNamed(AppRoute.login);

 
  }
  

 

}