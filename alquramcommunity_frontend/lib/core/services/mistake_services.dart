import 'dart:convert';

import 'package:alquramcommunity_frontend/core/constant/errorhandling.dart';
import 'package:get/get.dart';

import '../../data/model/backend_to_front_models/mistake_model.dart';
import '../constant/urls.dart';
import 'package:http/http.dart' as http;

class MistakeServices extends GetxService {
  static void mistakeLogging(List<Map<String, dynamic>> mistakeList) async {
    try {
      print(
          "inside mistake log ########################################################### $mistakeList");
      http.Response res = await http.post(
        Uri.parse(MyURL.addAllMistakeURL),
        body: jsonEncode(mistakeList),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("Response: ${res.toString()}");
    } catch (error) {
      print('noooo $error');
    }
  }

  static void deleteMistake(String userEmail, int surahId, int ayahID) async {
    try {
      print("inside deleteMistake  $surahId");
      http.Response res = await http.delete(
        Uri.parse("${MyURL.deleteMistake}/$userEmail/$surahId/$ayahID"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("Response: ${res.toString()}");
    } catch (error) {
      print('noooo $error');
    }
  }

  static Future<List<MistakeModel>> getMistakes(String id) async {
    List<MistakeModel> mistakesList = [];

    try {
      print("inside mistake get id: $id");
      print("${MyURL.getAllMistakeURL}$id");

      http.Response res = await http.get(
        Uri.parse("${MyURL.getAllMistakeURL}$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      List<dynamic> mistakesData = json.decode(res.body)['mistakes'];
      mistakesData.forEach((mistakeData) {
        MistakeModel mistake = MistakeModel.fromJson(mistakeData);
        mistakesList.add(mistake);
      });

      print("Mistakes: ${mistakesList[0].surahId}");
      return mistakesList;
    } catch (error) {
      print('noooo $error');
      return mistakesList;
    }
  }

  // static void mistakeLogging(List<Map<String, dynamic>> mistakeList) async {
  //   try {
  //     // MistakeModel mistakeModel = MistakeModel(
  //     //     userEmail: userEmail,
  //     //     mistakeType: mistakeType,
  //     //     weight: weight,
  //     //     surahId: surahId,
  //     //     ayahId: ayahId);
  //     print("inside mistake log $mistakeList");
  //     http.Response res = await http.post(
  //       Uri.parse(MyURL.addAllMistakeURL),
  //       body: jsonEncode(mistakeList),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     print("Response: ${res.toString()}");
  //   } catch (error) {
  //     print('noooo $error');
  //   }
  // }

//   final mistake = Mistake(name: 'John', age: 30);

// final response = await http.post(Uri.parse(url),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode(person.toJson()));

// if (response.statusCode == 200) {
//   // تم استلام رد بنجاح
//   print(response.body);
// } else {
//   // حدث خطأ أثناء استلام الرد
//   print('Request failed with status: ${response.statusCode}.');
// }
}
