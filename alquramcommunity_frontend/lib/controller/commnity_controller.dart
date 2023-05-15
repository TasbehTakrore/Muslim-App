import 'dart:convert';

import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../core/services/community_services.dart';
import '../core/services/services.dart';
import '../data/model/backend_to_front_models/community_model.dart';

class CommunitityController extends GetxController {
  TextEditingController? communityNameController = TextEditingController();
  TextEditingController? communityDescriptionController =
      TextEditingController();

  RxList<String> genders = ['ذكور', 'إناث'].obs;
  RxString selectedGender = 'ذكور'.obs;
  Rx<String> buttonTxt = 'إرسال طلب للانضمام'.obs;
  Rx<bool> rqFLag = false.obs;
  String? userEmail;
  MyServices myServices = Get.put(MyServices());
  CommunityServices communityServices = Get.put(CommunityServices());
  List<dynamic> communitiesList = [];
  var communities = [];
  String communityName = "";
  // String communityName;

  @override
  void onInit() {
    super.onInit();
    userEmail = myServices.sharedPreferences.getString("user_email");
    getAllCommunities();
    print("AllComm Inside onInit $communities");
  }

  void createNewCommunity() {
    communityServices.createNewCommunity(
        communityName: communityNameController!.text,
        communityDescription: communityDescriptionController!.text,
        adminEmail: userEmail!,
        usersGender: selectedGender.value,
        timerFlage: true);
    communityName = communityNameController!.text;
  }

  void sendRequest(int communityId) {
    communityServices.sendRequest(
        communityId: communityId, userEmail: userEmail!);
    print("inside Send");
  }

void deleteRequest(int communityId) {
    communityServices.deleteRequest(
        communityId: communityId, userEmail: userEmail!);
    print("inside delete");
  }
  int getGender() {
    int type;
    myServices.sharedPreferences.getString("user_gender") == "female"
        ? type = 0
        : type = 1;
    return type;
  }

  void getAllCommunities() async {
    try {
      communities = await communityServices.getAllCommunities(getGender());
      print("communities: $communities");
    } catch (error) {
      print('Error: $error');
    }
  }

  void buttonText() {
    print("Inside buttonText +${buttonTxt.value}+");
    if (buttonTxt.value == "إرسال طلب للانضمام") {
      buttonTxt.value = "إلغاء طلب الانضمام";
      rqFLag.value = true;
    } else {
      buttonTxt.value = "إرسال طلب للانضمام";
      rqFLag.value = false;
    }
  }
}
