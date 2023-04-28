import 'dart:convert';

import 'package:alquramcommunity_frontend/core/constant/errorhandling.dart';
import 'package:alquramcommunity_frontend/data/model/backend_to_front_models/user_model.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:alquramcommunity_frontend/core/services/services.dart';
import '../../provider/userprovider.dart';
import '../constant/routes.dart';
import '../constant/utils.dart';
//String uri='http://192.168.1.7:5000';

MyServices myServices = Get.put(MyServices());
String uri = 'http://192.168.199.151:5000';

class AuthServices {
   MyServices myServices = Get.put(MyServices());
  //sign up user
  void signUpUser({
    required BuildContext context,
    required String userName,
    required String userEmail,
    required int userAge,
    required String userPassword,
  }) async {
    try {
      RegisterModel registermodel = RegisterModel(
          id: '',
          userName: userName,
          userEmail: userEmail,
          userAge: userAge,
          userPassword: userPassword,
          token:''
          );

      http.Response res = await http.post(
        Uri.parse('$uri/users/signUp'),
        body: registermodel.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
       // ignore: use_build_context_synchronously
       httpErrorHandle (
        response: res,
        context: context,
         onSuccess: () { 
          showSnackBar(context,'Account cretated successfully, login in with same information');
          Get.toNamed(AppRoute.login);
          },
      );
    } catch (e) {
          showSnackBar(context,e.toString());
    }
  }

//Sign in
  void signInUser({
    required BuildContext context,
    required String userEmail,
    required String userPassword,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/users/logIn'),
        body: jsonEncode({
          'userEmail': userEmail,
          'userPassword': userPassword,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle  (
        response: res,
        context: context,
        onSuccess: () async{
          myServices.sharedPreferences.setString("x_auth_token", jsonDecode(res.body)['token']);
          myServices.sharedPreferences.setString("user_name", jsonDecode(res.body)['user']['userName']);
          myServices.sharedPreferences.setString("user_email", jsonDecode(res.body)['user']['userEmail']);
          myServices.sharedPreferences.setInt("user_id", jsonDecode(res.body)['user']['id']);

          print(myServices.sharedPreferences.getString("user_name"));
          //print(myServices.sharedPreferences.getString("user_email"));
          //print(myServices.sharedPreferences.getInt("user_id").toString());

         //SharedPreferences token = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context,listen:false).SetUser(res.body);
          //token.setString('x_auth_token', jsonDecode(res.body)['token']);
          showSnackBar(context,' Success');
          Get.toNamed(AppRoute.home);
          },
      );
    } catch (e) {
          showSnackBar(context,e.toString());
    }
  }
}

