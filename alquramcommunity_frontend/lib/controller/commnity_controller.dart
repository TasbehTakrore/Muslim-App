import 'dart:convert';

import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../core/services/community_services.dart';
import '../core/services/services.dart';
import '../data/model/backend_to_front_models/community_model.dart';
import '../data/model/backend_to_front_models/specificUder_Model.dart';

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
  int? communityID = 0;
  @override
  void onInit() {
    super.onInit();
    userEmail = getUserEmail();
    getAllCommunities();
    print("AllComm Inside onInit $communities");
  }

  String getUserEmail() {
    try {
      print(
          "myServices.sharedPreferences.getString(user_email): ${myServices.sharedPreferences.getString("user_email")}");
      return myServices.sharedPreferences.getString("user_email")!;
    } catch (error) {
      print("****EROOR getuserEmail + $error");
      return "";
    }
  }

  

  void createNewCommunity() async {
    communityID = await communityServices.createNewCommunity(
        communityName: communityNameController!.text,
        communityDescription: communityDescriptionController!.text,
        adminEmail: getUserEmail(),
        usersGender: selectedGender.value,
        timerFlage: true);
    communityName = communityNameController!.text;
  }

  Future<List<UserModel>> getMemberRequests(int communityID) async {
    return communityServices.getAllMemberRequests(communityID);
  }

  Future<List<UserModel>> getAllCommunityMembers(int communityID) async {
    return communityServices.getAllCommunityMembers(communityID);
  }

  void sendRequest(int communityId) {
    communityServices.sendRequest(
        communityId: communityId, userEmail: getUserEmail());
    print("inside Send");
  }

   updatee() {
    update();
  }

  addMemberCommunity(int communityId, bool isAdmin, String userEmail) {
    communityServices.addMemberCommunity(
        communityId: communityId,
        userEmail: isAdmin == true ? getUserEmail() : userEmail,
        isAdmin: isAdmin);
    print("inside Send member community...");
  }

  void deleteRequest(int communityId, String userEmail) {
    communityServices.deleteRequest(
        communityId: communityId, userEmail: userEmail);
    print("inside delete");
  }

  void acceptUser(String userEmail) {}
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

  getMyCommunities() {
    print("[[ userEmail : $userEmail");
    print(
        "getMyCommunities Email: ${myServices.sharedPreferences.getString("user_email")}}");
    communityServices.getMyCommunities(
        userEmail: myServices.sharedPreferences.getString("user_email")!);
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
