import 'dart:convert';
import 'package:alquramcommunity_frontend/data/model/front_models/thikrmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

abstract class ThikrCatgController extends GetxController {
  Future<String> _loadJSON();
  Future<dynamic> loadJSON();
  initialData();
  decrementRepeat(int listIndex, int itemIndex);
  RxInt selectedThikr=0.obs;
  }

class ThikrCatgControllerImp extends ThikrCatgController{
  final List<List<int>> countersList = [];
  dynamic argumentData ;
  List<Thikr> data = [];
  var myData = Athkar().obs;
  dynamic? jsonResponse;

  @override
  Future<String> _loadJSON()   async {
    return await rootBundle.loadString('assets/thikr.json');
  }
  Future<dynamic> loadJSON() async {
    String json = await _loadJSON();
    jsonResponse = jsonDecode(json);  
    return jsonResponse;
  }


  //////////////////////////////try
  Future<void> dataaa() async {
    await loadJSON();
    data =  List<Thikr>.from(
    jsonResponse["Thikr"].map((x) => Thikr.fromJson(x))); 
    for (int i = 0; i <  (myData.value.thikr?.length ?? 0); i++) {
      Thikr? subList =  myData.value.thikr?[i];
      List<int> subCounters = [];
      for (int j = 0; j < subList!.tEXT!.length; j++) {
        subCounters.add(data[selectedThikr.value].tEXT![j].rEPEAT!);
        if(i==0)print(':::${countersList[i][j]} \n');
      countersList.add(subCounters);
    }
    update();
    } 
  }
  ///////////////////////////////

  
  @override
  initialData() {
   argumentData = Get.arguments;
   final stringList = argumentData.map((item) => item.toString()).toList();
   final intList=stringList.map((str) => int.parse(str)).toList();
   selectedThikr.value=intList[0];
  }
  
Future<void> my()async {
    //countersList.clear();
    for (int i = 0; i <  (myData.value.thikr?.length ?? 0); i++) {
      Thikr? subList =  myData.value.thikr?[i];
      List<int> subCounters = [];
      for (int j = 0; j < subList!.tEXT!.length; j++) {
        subCounters.add(0);
      countersList.add(subCounters);
    }
    update();
}
}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  showAthkar(msg) {
    String message = '';
    for (int i = 0; i < 1; i++) {
      message += ', i hope you have an amazing day \n';
    }
    Get.snackbar(msg,'');
  }
  @override
  isFinish(currentCount){
    if(currentCount==0) {
      return true;
    } else {
      return false ;
    }
  }

  @override
  decrementRepeat(int listIndex, int itemIndex) {
     if (countersList[listIndex][itemIndex]> 0) {
       countersList[listIndex][itemIndex]=countersList[listIndex][itemIndex]-1;
       print('${countersList[listIndex][itemIndex]}');
           update(); 
    }  
    update(); 
  }
  Future<void> selectThikr(int index) async {
    selectedThikr.value = index;
    await my();
    loadJSON().then((value) {
    myData.value = Athkar.fromJson(value);
  });
    update();
  }
  
/*
  @override
  bool isFinish(int currentCount) {
    // TODO: implement isFinish
    throw UnimplementedError();
  }

  @override
  showAthkar(String s) {
    // TODO: implement showAthkar
    throw UnimplementedError();
  }
*/
}



