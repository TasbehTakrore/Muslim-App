import 'dart:io';

import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/services/services.dart';

abstract class SignUpController extends GetxController {
  signUp();
  ToSignIn();
}

class SignUpControllerImp extends SignUpController {
  final AuthServices authServices = AuthServices();
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController age;
  late TextEditingController password;
  late TextEditingController checkPassword;
  RxList<String> genders = ['ذكر', 'أنثى'].obs;
  RxString selectedGender = 'male'.obs;
  var isProfileImgPathSet = false.obs;
  var profileImg = File('').obs;
  MyServices myServices = Get.put(MyServices());

  @override
  signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    age = TextEditingController();
    checkPassword = TextEditingController();
    loadDefaultProfileImg();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    age.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    clearFields();
    super.onClose();
  }

  @override
  ToSignIn() {
    Get.toNamed(AppRoute.login);
  }

  void profileImageSet(File file) {
    profileImg.value = file;
    isProfileImgPathSet.value = true;
  }

  Future<void> loadDefaultProfileImg() async {
    final bytes = await rootBundle.load('assets/images/user.png');
    profileImg.value =
        File('${(await getTemporaryDirectory()).path}/default_profile_img.png');
    await profileImg.value
        .writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    isProfileImgPathSet.value = true;
  }

  void deletesharedPreferences() {
    myServices.sharedPreferences.setString("x_auth_token", "");
    myServices.sharedPreferences.setString("user_name", "");
    myServices.sharedPreferences.setString("user_email", "");
    myServices.sharedPreferences.setInt("user_id", 0);
    myServices.sharedPreferences.setString("user_gender", "");
    myServices.sharedPreferences.setInt("user_coins", 0);
  }

  void clearFields() {
    name.text = '';
    age.text = '';
    password.text = '';
    checkPassword.text = '';
    email.text = '';
  }
}
