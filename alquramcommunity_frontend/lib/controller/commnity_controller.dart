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
  Rx<String> buttonTxt = 'Request to join'.obs;
  Rx<bool> rqFLag = false.obs;
  String? userEmail;
  MyServices myServices = Get.put(MyServices());
  CommunityServices communityServices = Get.put(CommunityServices());
  List<dynamic> communitiesList = [];
  var communities;
  @override
  void onInit() {
    super.onInit();
    userEmail = myServices.sharedPreferences.getString("user_email");
    getAllCommunities();
  }

  void createNewCommunity() {
    communityServices.createNewCommunity(
        communityName: communityNameController!.text,
        communityDescription: communityDescriptionController!.text,
        adminEmail: userEmail!,
        usersGender: selectedGender.value,
        timerFlage: true);
  }

  void getAllCommunities() async {
    try {
      communities = await communityServices.getAllCommunities();
      print("communities: $communities");
    } catch (error) {
      print('Error: $error');
    }
  }

  void buttonText() {
    if (buttonTxt.value == "Request to join") {
      buttonTxt.value = "Request sended";
      rqFLag.value = true;
    } else {
      buttonTxt.value = "Reqest to join";
      rqFLag.value = false;
    }
  }
}
