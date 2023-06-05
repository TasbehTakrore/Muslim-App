import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  Rx<String> stikyMessage = "".obs;
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
  var db = FirebaseFirestore.instance;
  String communityChatID = "";
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

  Future<void> addAnouncement(int communityID, String announceMessage) async {
    print("inside");
    communityServices.addAnouncement(
        communityID: communityID, announceMessage: announceMessage);
    stikyMessage.value = announceMessage;
    update();
    // communityServices.get
  }

  Future<void> getAnouncement(int communityID) async {
    String data =
        await communityServices.getStickyMessage(communityId: communityID);
    stikyMessage.value = data;
    // update();
    // communityServices.get
  }

  Future createNewCommunity() async {
    final communityChat = <String, dynamic>{
      "communityName": communityNameController!.text,
      "adminEmail": userEmail
    };
    DocumentReference doc;
    var result = await db.collection("groupsChat").add(communityChat);
    // return result.id;
    print("result.id : ${result.id}");
    communityChatID = result.id;
    communityID = await communityServices.createNewCommunity(
        communityChatID: result.id,
        communityName: communityNameController!.text,
        communityDescription: communityDescriptionController!.text,
        adminEmail: getUserEmail(),
        usersGender: selectedGender.value,
        timerFlage: true);
    communityName = communityNameController!.text;

    // db.collection("groupsChat").doc(doc.id);
    print("communityID:communityID:communityID $communityID");
  }

  Future<List<UserModel>> getMemberRequests(int communityID) async {
    return communityServices.getAllMemberRequests(communityID);
  }

  getName() {
    print(myServices.sharedPreferences.get("user_name"));
    return myServices.sharedPreferences.get("user_name");
  }

  sendMessage({required communityChatID, required message}) async {
    print("userEmail: ${getUserEmail()}");
    var result = await db
        .collection("groupsChat")
        .doc(communityChatID)
        .collection("messages")
        .add({
      "senderEmail": getUserEmail(),
      "senderMessage": message,
      "senderName": getName(),
      "time": DateTime.now()
    });
    print("result.id: ${result.id}");
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

  addMemberCommunity(int communityId, bool isAdmin, String userEmail) async {
    await communityServices.addMemberCommunity(
        communityId: communityId,
        userEmail: isAdmin == true ? getUserEmail() : userEmail,
        isAdmin: isAdmin);
    print("inside Send member community...");
    updatee();
  }

  void deleteRequest(int communityId, String userEmail) {
    communityServices.deleteRequest(
        communityId: communityId, userEmail: userEmail);
    print("inside delete");
  }

  void acceptUser(String userEmail) {}
  int getGender() {
    int type;
    print(myServices.sharedPreferences.getString("user_gender"));
    myServices.sharedPreferences.getString("user_gender") == "female"
        ? type = 0
        : type = 1;

    print("Type inside getGender: $type");
    return type;
  }

  void getAllCommunitiesGender() async {
    try {
      communities = await communityServices.getAllCommunities(getGender());

      print("communities: $communities");
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> getAllCommunities() async {
    try {
      communities = await communityServices.getAllCommunities(2);

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
