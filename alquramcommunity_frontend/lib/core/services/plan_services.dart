import 'dart:convert';

import 'package:get/get.dart';
import '../../data/model/backend_to_front_models/userplan_model.dart';
import '../constant/urls.dart';
import 'package:http/http.dart' as http;

class PlanServices extends GetxService {

 Future<void> updatePlan(int userId, List<dynamic> planData) async {
    print("strat updating user ${userId} plan\n");
    final Map<String, dynamic> planJson = {
      'fiveprays': planData[0],
      'Duha': planData[1],
      'qiyam': planData[2],
      'traweeh': planData[3],
      'morning': planData[4],
      'evening': planData[5],
      'sleeping': planData[6],
      'wakingup': planData[7],
      'wudu': planData[8],
      'praythikr': planData[9],
      'athanthikr':planData[10],
      'readplan': planData[11],
      'read_amount': planData[12],
      'tadaburplan': planData[13],
      'tadabur_amount': planData[14],
      'memorizingplan': planData[15],
      'memorizing_amount': planData[16]
    };
    try {
      final response = await http.post(
        Uri.parse('${MyURL.addupActivePlanURL}/$userId'),
        body: jsonEncode(planJson),
         headers: {"Content-Type": "application/json"}
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final UserPlan userPlan = UserPlan.fromJson(data['data']);
      } else {
        throw Exception("Failed to update plan");
      }
    } catch (e) {
      print(e);
      throw Exception("Failed to update plan : $e");
    }
  }

 Future<Map<String, dynamic>> getActivePlan(int userId) async {
  final String apiUrl = ('${MyURL.getPlanURL}/$userId');
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body)['data'];
    return {'message': 'found', 'data': jsonData};
  } else if (response.statusCode == 404) {
    return {'message': 'Active plan not found', 'data': null};
  } else {
    throw Exception('Failed to load active plan');
  }
}
}

