import 'dart:convert';

import 'package:alquramcommunity_frontend/core/constant/errorhandling.dart';
import 'package:alquramcommunity_frontend/data/model/backend_to_front_models/user_model.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../constant/routes.dart';
//String uri='http://192.168.1.7:5000';


String uri = 'http://192.168.1.8:5000';

class AuthServices {
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
          userPassword: userPassword);

      http.Response res = await http.post(
        Uri.parse('$uri/users/signUp'),
        body: registermodel.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          print('account created');
        },
      );
    } catch (error) {
      print('noooo ');
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
      print(res.body);
      if (res.statusCode == 200) {
        print('login in success');

        Get.toNamed(AppRoute.home);
      } else {
        print('login failed with status code ${res.statusCode}');
      }
    } catch (error) {
      print('login failed with error $error');
    }
  }
}

