import 'dart:convert';

import 'package:get/get.dart';
import '../../data/model/backend_to_front_models/community_model.dart';
import '../../data/model/backend_to_front_models/specificUder_Model.dart';
import '../../data/model/backend_to_front_models/user_model.dart';
import '../constant/urls.dart';
import 'package:http/http.dart' as http;

import 'auth_services.dart';

class CommunityServices extends GetxService {
  AuthServices authServices = Get.put(AuthServices());
  Future<int> createNewCommunity(
      {required String communityName,
      required String communityDescription,
      required String adminEmail,
      required String usersGender,
      required bool timerFlage}) async {
    try {
      print("${MyURL.createCommunityURL} ++ $usersGender");
      http.Response res = await http.post(
        Uri.parse(MyURL.createCommunityURL),
        body: jsonEncode({
          'communityName': communityName,
          'communityDescription': communityDescription,
          'adminEmail': adminEmail,
          'usersGender': usersGender == "إناث" ? "female" : "male",
          'timerFlage': timerFlage,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      print(
          "Response Community:${json.decode(res.body)['community']['id']}  +${json.decode(res.body)}");
      addMemberCommunity(
          communityId: json.decode(res.body)['community']['id'],
          userEmail: adminEmail,
          isAdmin: true);
      return json.decode(res.body)['community']['id'];
    } catch (error) {
      print('noooo $error');
      return 0;
    }
  }

  Future<List<Community>> getAllCommunities(int type) async {
    // if 0= femal, if 1=male
    try {
      print("Type $type");
      final response;
      type == 0
          ? response =
              await http.get(Uri.parse(MyURL.getAllCommunitiesFemaleURL))
          : type == 1
              ? response =
                  await http.get(Uri.parse(MyURL.getAllCommunitiesMaleURL))
              : response = await http.get(Uri.parse(MyURL.getAllCommunitie));

      if (response.statusCode == 200) {
        final communitiesMap = jsonDecode(response.body);
        final communities = communitiesMap['communities'] as List<dynamic>;
        final communitiesList = communities
            .map((community) => Community.fromJson(community))
            .toList();
        print("response communitiesList:: ${response.body}");
        return communitiesList;
      } else {
        throw Exception('Failed to load communities');
      }
    } catch (error) {
      print('Error: $error');
      rethrow;
    }
  }

  Future<List<UserModel>> getAllMemberRequests(int communityID) async {
    try {
      print(Uri.parse(MyURL.getAllMemberRequests + "/$communityID"));
      http.Response response = await http
          .get(Uri.parse(MyURL.getAllMemberRequests + "/$communityID"));
      List<String> requestEmails = [];
      if (response.statusCode == 200) {
        final List<dynamic> responseRequest =
            jsonDecode(response.body)['requests'];
        responseRequest.forEach((element) {
          requestEmails.add(element['userReqEmail']);
        });
        print("requestEmails res:  ${requestEmails}");
        List<UserModel> usersRequ = [];
        await Future.wait(requestEmails.map((element) async {
          print("element ## $element");
          UserModel user = await authServices.getUserProfileByEmail(element);
          usersRequ.add(user);
          print(user.imageUrl);
        }));
        print("*************usersRequ: $usersRequ");
        return usersRequ;
      } else {
        throw Exception('Failed to load memb Requests');
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  Future<List<UserModel>> getAllCommunityMembers(int communityID) async {
    try {
      http.Response response = await http
          .get(Uri.parse(MyURL.getAllCommunityMembers + "/$communityID"));
      List<String> usersEmails = [];
      if (response.statusCode == 200) {
        print(Uri.parse(MyURL.getAllCommunityMembers + "/$communityID"));
        print("response.body res:  ${response.body}");

        final List<dynamic> responseRequest =
            jsonDecode(response.body)['members'];
        responseRequest.forEach((element) {
          usersEmails.add(element['userEmail']);
        });
        List<UserModel> usersMemb = [];
        await Future.wait(usersEmails.map((element) async {
          print("element ## $element");
          UserModel user = await authServices.getUserProfileByEmail(element);
          usersMemb.add(user);
          print(user.imageUrl);
        }));
        print("*************usersMemb: $usersMemb");
        return usersMemb;
      } else {
        throw Exception('Failed to load memb Requests');
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  void sendRequest(
      {required int communityId, required String userEmail}) async {
    try {
      final body = {
        'communityID': communityId.toString(),
        'userReqEmail': userEmail
      };
      final response = await http.post(
        Uri.parse(MyURL.sendRequest),
        body: jsonEncode(
            {'communityID': communityId.toString(), 'userReqEmail': userEmail}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        print('Request sent successfully');
      } else {
        print(response.toString());
        print('Failed to send request');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void addMemberCommunity(
      {required int communityId,
      required String userEmail,
      required bool isAdmin}) async {
    try {
      final response = await http.post(
        Uri.parse(MyURL.addMemberCommunity),
        body: jsonEncode({
          'communityID': communityId.toString(),
          'userEmail': userEmail,
          'isAdmin': isAdmin
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        print('addMemberCommunity sent successfully + ${response.body}');
      } else {
        print(response.toString());
        print('Failed to addMemberCommunity request + ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  // Future<List<Community>> getMyCommunities({required String userEmail}) async {
  Future<List<String>> getMyCommunities({required String userEmail}) async {
    try {
      print("userEmail: $userEmail");
      final response = await http.get(
        Uri.parse("${MyURL.getMyCommunities}/$userEmail"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        print("==========");
        print('getMyCommunities sent successfully + ${response.body}');

        final List<dynamic> communityList =
            jsonDecode(response.body)['communities'];
        print("communityList ---------------------: $communityList");
        List<String> IDList = [];

        communityList.forEach((element) {
          print("element:  ???????????? $element.runtimeType");

          IDList.add(element['communityID'].toString());
          print("IDList $IDList");
        });
// final List<Community> communities = communityList.map((community) {
//   return Community(
//     id: community['communityID'],
//     isAdmin: community['isAdmin'],
//     userEmail: community['userEmail'],
//     createdAt: DateTime.parse(community['createdAt']),
//     updatedAt: DateTime.parse(community['updatedAt']),
//   );
// }).toList();

        // final  = communitiesMap['communities'] as List<dynamic>;
        // final communitiesList = communities
        //     .map((community) => Community.fromJson(community))
        //     .toList();
        return IDList;
      } else {
        print(response.toString());
        print('Failed to getMyCommu request + ${response.body}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  void deleteRequest(
      {required int communityId, required String userEmail}) async {
    try {
      final response = await http.delete(
        Uri.parse('${MyURL.deleteRequest}/$communityId/$userEmail'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        print('Request deleted successfully');
      } else {
        print('Failed to delete request + ${response.toString()}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
