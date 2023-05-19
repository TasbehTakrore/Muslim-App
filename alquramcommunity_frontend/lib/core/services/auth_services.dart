import 'dart:convert';
import 'dart:io';
import 'package:alquramcommunity_frontend/core/constant/errorhandling.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alquramcommunity_frontend/core/services/services.dart';
import '../../controller/profileController.dart';
import '../../data/model/backend_to_front_models/specificUder_Model.dart';
import '../../data/model/backend_to_front_models/user_model.dart';
import '../constant/routes.dart';
import '../constant/utils.dart';
import 'package:http_parser/http_parser.dart';

// String uri='http://192.168.1.7:5000';

MyServices myServices = Get.put(MyServices());

class AuthServices extends GetxService {
  // String uri = 'http://172.19.108.121:5000';

  String uri = 'http://192.168.1.19:5000';
  String uri2 = 'http://192.168.1.19:8080';

  // static const String uri = 'http://172.19.66.29:5000';

  final ProfileController profilesController = Get.put(ProfileController());

  //sign up user
  void signUpUser({
    required BuildContext context,
    required String userName,
    required String userEmail,
    required int userAge,
    required String userGender,
    required String userPassword,
    required File? image,
  }) async {
    try {
      print("$uri/users/signUp");
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$uri/users/signUp'),
      );

      if (image != null) {
        final bytes = await image.readAsBytes();
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            bytes,
            filename: image.path.split('/').last,
            contentType: MediaType('image', 'jpeg'),
          ),
        );
      }

      request.fields.addAll({
        'userName': userName,
        'userEmail': userEmail,
        'userAge': userAge.toString(),
        'userGender': userGender,
        'userPassword': userPassword,
        'token': '',
      });

      var response = await request.send();
      if (response.statusCode == 200) {
        // Handle success case
        showSnackBar(context,
            'Account created successfully, login with same information');
        Get.toNamed(AppRoute.login);
      } else {
        // Handle error case
        showSnackBar(context, 'Failed to create account');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//Sign in
  void signInUser({
    required BuildContext context,
    required String userEmail,
    required String userPassword,
  }) async {
    try {
      print("ngklmf,x");
      print("$uri/users/logIn");
      http.Response res = await http.post(
        Uri.parse('$uri/users/logIn'),
        body: jsonEncode({
          'userEmail': userEmail,
          'userPassword': userPassword,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          print("##################################################");

          myServices.sharedPreferences
              .setString("x_auth_token", jsonDecode(res.body)['token']);
          myServices.sharedPreferences
              .setString("user_name", jsonDecode(res.body)['user']['userName']);
          myServices.sharedPreferences.setString(
              "user_email", jsonDecode(res.body)['user']['userEmail']);
          myServices.sharedPreferences.setString(
              "user_gender", jsonDecode(res.body)['user']['userGender']);
          print(
              "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ${myServices.sharedPreferences.getString("user_email")}");
          myServices.sharedPreferences
              .setInt("user_id", jsonDecode(res.body)['user']['id']);

          //      myServices.sharedPreferences.setInt("user_age", jsonDecode(res.body)['userAge']);
          //  myServices.sharedPreferences.setString("prof_gender", jsonDecode(res.body)['userGender']);

          print(myServices.sharedPreferences.getString("user_name"));
          //print(myServices.sharedPreferences.getString("user_email"));
          //print(myServices.sharedPreferences.getInt("user_id").toString());

          //SharedPreferences token = await SharedPreferences.getInstance();
          // Provider.of<UserProvider>(context,listen:false).SetUser(res.body);
          //token.setString('x_auth_token', jsonDecode(res.body)['token']);
          showSnackBar(context, ' Success');
          Get.toNamed(AppRoute.home);
          profilesController.userInformation();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<Map<String, dynamic>> getUserProfile(int userId) async {
    final response = await http.get(Uri.parse('$uri/users/showUser/$userId'));
    if (response.statusCode == 200) {
      final userProfile = jsonDecode(response.body);
      return userProfile;
    } else {
      throw Exception('Failed to get user profile data');
    }
  }

  Future<UserModel> getUserProfileByEmail(String userEmail) async {
    final response =
        await http.get(Uri.parse('$uri/users/showUserByEmail/$userEmail'));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      var userJson = responseData['user'];
      // RegisterModel userProfile = RegisterModel.fromJson(userJson.toString());
      print("userProfile: ${userJson['id']}");
      return UserModel(
        id: userJson['id'],
        userName: userJson['userName'],
        userEmail: userJson['userEmail'],
        userAge: userJson['userAge'],
        userGender: userJson['userGender'],
        imageUrl: userJson['imageUrl'],
      );
      // return userProfile;
    } else {
      throw Exception('Failed to get user profile data');
    }
  }

  updateUser({
    required String id,
    required String name,
    required String age,
    required String gender,
    required String password,
    required String checkPassword,
  }) async {
    try {
      final response = await http.put(
        Uri.parse('$uri/users/updateUser/${id}'),
        body: jsonEncode({
          'name': name,
          'age': age,
          'gender': gender,
          'password': password,
          'checkPassword': checkPassword,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final userProfile = await jsonDecode(response.body);
        profilesController.userName.value = userProfile['user']['userName'];
        profilesController.userAge.value =
            userProfile['user']['userAge'].toString();
        profilesController.userGender.value = userProfile['user']['userGender'];
        Get.back();
      } else {
        //SnackBar(content: Text("wrong password"));
        Get.back();
      }
    } catch (e) {
      print(e);
    }
  }
}
