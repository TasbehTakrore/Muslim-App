import 'dart:convert';

import 'package:alquramcommunity_frontend/core/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/urls.dart';

class CoinsServices extends GetxService {
  static void addCoins(int coins) async {
    String userEmail = myServices.sharedPreferences.getString("user_email")!;
    try {
      print(
          "inside coins log ###########################################################");
      http.Response res = await http.post(
        Uri.parse(MyURL.addCoins),
        body: jsonEncode({
          'userEmail': userEmail,
          'userCoins': coins,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("Response coins: ${res.toString()}");
    } catch (error) {
      print('noooo $error');
    }
  }
}