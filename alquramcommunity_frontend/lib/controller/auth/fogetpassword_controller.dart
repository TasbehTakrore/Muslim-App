import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/auth_services.dart';
import '../../view/widget/auth/verifycodedialog.dart';
  final AuthServices authservices = AuthServices();

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
  ToRecievedCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{
  late TextEditingController email;
  final TextEditingController pinController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  late  BuildContext context;
  bool sended=false;
  @override
  checkEmail() {
   sended=false;
   authservices.checkUser(context: context, userEmail: email.text);
   print(sended);
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
  final inputeDecoration=InputDecoration(
    contentPadding: 
      EdgeInsets.symmetric(
      vertical: 15,),
      enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color:Colors.black),
      borderRadius: BorderRadius.circular(20),),
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color:Colors.black),
      borderRadius: BorderRadius.circular(20),),
      border: OutlineInputBorder(
      borderSide: BorderSide(color:Colors.black),
      borderRadius: BorderRadius.circular(20),),
      );

  final List<String> pin = List.generate(5, (_) => "");
  
  void updatePin(int index, String value) {
      if (index >= 0 && index < pin.length) {
    // Update the pin digit at the specified index
    pin[index] = value;
     }

  // Update the entire pin list
     pin.forEach((digit) => print(digit)); // print each digit in the updated list

    
    update();
  }
  String get pinValue => pin.join();

  void chngPass(){
    print(pinValue);
    authservices.updatePassword(context: context, email:email.text, newPassword: newPasswordController.text, vCode: pinValue);
  }



}