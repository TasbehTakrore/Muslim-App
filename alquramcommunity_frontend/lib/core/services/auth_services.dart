import 'package:alquramcommunity_frontend/core/constant/errorhandling.dart';
import 'package:alquramcommunity_frontend/data/model/backend_to_front_models/user_model.dart';
import 'package:flutter/Material.dart';
import 'package:http/http.dart' as http;
String uri='http://192.168.199.151:5000';
class AuthServices{

  //sign up user 
  void signUpUser({
    required BuildContext context,
    required String userName,
    required String userEmail,
    required int userAge,
    required String userPassword,
  })async{
    try{
      RegisterModel registermodel =RegisterModel(
        id: '',
        userName: userName,
        userEmail: userEmail,
        userAge: userAge,
        userPassword: userPassword);

      http.Response res= await http.post(
      Uri.parse('$uri/users/signUp'),
      body: registermodel.toJson(),
      headers: <String,String>{
      'Content-Type':'application/json; charset=UTF-8',
      },
      );

     httpErrorHandle(
      response: res,
      context: context,
      onSucess: () { 
        print('account created');
       },);
    }catch(error){
       
    }

  }
}