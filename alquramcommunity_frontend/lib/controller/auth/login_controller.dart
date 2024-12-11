import 'dart:convert';

import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
    FirebaseMessaging.instance.subscribeToTopic("general");
    //getMessage();
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

   String token="AAAAI03IwMs:APA91bEHfmV4j3oHTXmOToohdH-uPQyo9FtbffZmpi4TXGMFb1MBh23vQ5pSYFLpRtlFsq2vgjXifdY3T5pTpcyVs2mt3YizyNde2snwCNmvWJ32NxP_s1WJFeD8OUWkhTSnTfUZ9_R8";
sendnotify(String title,String body,String id) async {
   await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
     headers: <String, String>{
       'Content-Type': 'application/json',
       'Authorization': 'key=$token',
     },
     body: jsonEncode(
     <String, dynamic>{
       'notification': <String, dynamic>{
         'body': 'this is a body',
         'title': 'this is a title'
       },
       'priority': 'high',
       'data': <String, dynamic>{
         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
         'id': '1',
         'name': 'ayah'
       },
       'to': await FirebaseMessaging.instance.getToken(),
     },
    ),
  );
}
getMessage(){
  FirebaseMessaging.onMessage.listen((event){
  print("======================data notificator ===================================");
print("${event.notification!.title}");
print("${event.notification!.body}");
print("${event.data}");

  print("======================data notificator end ===================================");

}); 
}

}