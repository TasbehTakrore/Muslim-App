import 'dart:convert';
import 'package:alquramcommunity_frontend/data/model/front_models/thikrmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class ThikrCatgController extends GetxController {
  RxBool loading = false.obs;
  //  late Athkar  athkar ;
  // List<Thikr> categories = [];

  // @override
  // void onInit() {
  //   super.onInit();
  //   getAthkar();
  // }

  // Future getAthkar() async {
  //   final jsonData = await rootBundle.loadString("assets/thikr.json");

  //   var list = jsonDecode(jsonData);

  //   return list;
  // }

  Future<String> _loadJSON() async {
    return await rootBundle.loadString('assets/thikr.json');
  }

  Future<dynamic> loadJSON() async {
    String json = await _loadJSON();
    final jsonResponse = jsonDecode(json);
    return jsonResponse;
  }

  var myData = Athkar().obs;

  @override
  void onInit() {
    loadJSON().then((value) {
      myData.value = Athkar.fromJson(value);
    });
    super.onInit();
  }
}
