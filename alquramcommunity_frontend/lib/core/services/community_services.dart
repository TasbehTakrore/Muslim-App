import 'dart:convert';

import 'package:get/get.dart';
import '../../data/model/backend_to_front_models/community_model.dart';
import '../constant/urls.dart';
import 'package:http/http.dart' as http;

class CommunityServices extends GetxService {
  void createNewCommunity(
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
    } catch (error) {
      print('noooo $error');
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
          : response =
              await http.get(Uri.parse(MyURL.getAllCommunitiesMaleURL));
      if (response.statusCode == 200) {
        final communitiesMap = jsonDecode(response.body);
        final communities = communitiesMap['communities'] as List<dynamic>;
        final communitiesList = communities
            .map((community) => Community.fromJson(community))
            .toList();
        return communitiesList;
      } else {
        throw Exception('Failed to load communities');
      }
    } catch (error) {
      print('Error: $error');
      rethrow;
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
