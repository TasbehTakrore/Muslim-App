import 'dart:convert';
import 'package:alquramcommunity_frontend/core/constant/urls.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;

class TasbehServices extends GetxService {
  Future<void> createTasbehEntry(int userId, Map<String, dynamic> data) async {
    try {
      const url = MyURL.addTasbehCount;
      print("UserId Inside createTasbehEntry : $userId");
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'user_id': userId, 'data': data}),
      );

      if (response.statusCode == 201) {
        // Tasbeh entry created successfully
        print('Tasbeh entry created successfully');
      } else {
        // Failed to create Tasbeh entry
        print('Failed to create Tasbeh entry: ${response.statusCode}');
      }
    } catch (error) {
      print('Error creating Tasbeh entry: $error');
    }
  }

  Future<int> getUserTasbeh(int userId) async {
    final url = Uri.parse('${MyURL.getTsbehCount}/$userId');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final totalSum =
            int.parse(data['totalSum'] ?? '0'); // Parse the value as an integer
        print("tot $totalSum");
        return totalSum;
      } else {
        print('Error: ${response.statusCode}');
        return 0;
      }
    } catch (error) {
      print('Error: $error');
      return 0;
    }
  }
}
