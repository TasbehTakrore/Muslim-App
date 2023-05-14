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
      print("Response coins: ${res.toString()}");
    } catch (error) {
      print('noooo $error');
    }
  }

Future<List<Community>> getAllCommunities() async {
  try {
    final response = await http.get(Uri.parse(MyURL.getAllCommunitiesURL));
    if (response.statusCode == 200) {
      final communitiesMap = jsonDecode(response.body);
      final communities = communitiesMap['communities'] as List<dynamic>;
      final communitiesList = communities.map((community) => Community.fromJson(community)).toList();
      return communitiesList;
    } else {
      throw Exception('Failed to load communities');
    }
  } catch (error) {
    print('Error: $error');
    rethrow;
  }
}

}
