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

  }
class ThikrCatgControllerImp extends ThikrCatgController{
  final List<List<RxInt>> countersList = [];
  late String tit="";
  late int  selectedThikr;
  dynamic argumentData ;


  @override
  Future<String> _loadJSON()   async {
    return await rootBundle.loadString('assets/thikr.json');
  }
  Future<dynamic> loadJSON() async {
    String json = await _loadJSON();
    final jsonResponse = jsonDecode(json);
    return jsonResponse;
  }
  var myData = Athkar().obs;
  @override
  initialData() {
   argumentData = Get.arguments;
   final stringList = argumentData.map((item) => item.toString()).toList();
   final intList=stringList.map((str) => int.parse(str)).toList();
   selectedThikr =intList[0];
   print(selectedThikr);
  }
void my(){
    for (int i = 0; i <  (myData.value.thikr?.length ?? 0); i++) {
       
      Thikr? subList =  myData.value.thikr?[i];
      List<RxInt> subCounters = [];
      for (int j = 0; j < subList!.tEXT!.length; j++) {
        subCounters.add(RxInt(0));
      }
      countersList.add(subCounters);
    }
}
  @override
  void onInit() {
    initialData();
    loadJSON().then((value) {
     myData.value = Athkar.fromJson(value);
     print(myData);
    });
    my();
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
     if (countersList[listIndex][itemIndex].value> 0) {
       countersList[listIndex][itemIndex].value--;
      update();
    }   
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