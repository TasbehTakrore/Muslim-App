import 'dart:convert';

import 'package:alquramcommunity_frontend/controller/auth/chartsController.dart';
import 'package:alquramcommunity_frontend/controller/auth/plan_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../data/model/backend_to_front_models/userplan_model.dart';
import '../constant/urls.dart';
import 'package:http/http.dart' as http;

class PlanServices extends GetxService {
  PlanController planController=Get.put(PlanController());

 Future<void> updatePlan(int userId, List<dynamic> planData) async {
  print("strat updating user ${userId} plan\n");
final List<String> keys = [
    'fiveprays',
    'Duha',
    'qiyam',
    'traweeh',
    'morning',
    'evening',
    'sleeping',
    'wakingup',
    'wudu',
    'praythikr',
    'athanthikr',
    'readplan',
    'read_amount',
    'tadaburplan',
    'tadabur_amount',
    'memorizingplan',
    'memorizing_amount',
    'fivepraysF',
    'DuhaF',
    'qiyamF',
    'traweehF',
    'morningF',
    'eveningF',
    'sleepingF',
    'wakingupF',
    'wuduF',
    'praythikrF',
    'athanthikrF',
    'read_amountCount',
    'tadabur_amountCount',
    'memorizing_amountCount',
    'dataStatus',
  ];
  
  final Map<String, dynamic> planJson = Map.fromEntries(
    keys.asMap().entries.map((entry) => MapEntry(entry.value, planData[entry.key]))
  );
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

Future<void> addBackup(Map<String,dynamic> planData) async {
    print("strat add backup user\n");

  final Map<String, dynamic> planJson = planData;
  try {
      final response = await http.post(
        Uri.parse('${MyURL.addBackup}'),
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

Future<void> deleteRecords(int userId) async {
        print("in delete data\n");
  final url = Uri.parse('${MyURL.deleteRecords}/$userId');
  
  try {
    final response = await http.delete(url);
    
    if (response.statusCode == 200) {
      print('Records deleted successfully');
    } else {
      print('Failed to delete records');
    }
  } catch (error) {
    print('Something went wrong: $error');
  }
}

Future<void> refreshTasks(int userId) async {
  final url = '${MyURL.refreshRecords}/$userId';

  try {
    final response = await http.post(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // Successful update
      print('Active plan updated successfully');
    } else if (response.statusCode == 400) {
      // No user found
      print('No user');
    } else {
      // Handle other error cases
      print('Something went wrong: ${response.body}');
    }
  } catch (error) {
    print('Something went wrong: $error');
  }
}

 int weekData() {
  
 DateTime now = DateTime.now();
 //    DateTime now = DateTime.now().add(Duration(days:1));
    String dayName = DateFormat('EEEE').format(now);//اليوم
    List <String> dayNames = [
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
    ];//السبت بداية الأسبوع
    int daysPassed=0;
    for(int i=0;i<7;i++)  {
      if(dayName==dayNames[i]){
        daysPassed=i+1;
        break;
      }
    }
    return daysPassed;
   // Map<String,dynamic> record = await getActivePlan(userId);
}

Future <Map<String, dynamic>>fetchWeekData(int userId) async {
  try {
    final response = await http.get(
      Uri.parse('${MyURL.getWeekRecored}/$userId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Access the data using data['data']
      final weekDataMap = json.decode(response.body)['data'];
    return {'message': 'found', 'data': weekDataMap};

    } else {
      print('Error: ${response.statusCode}');
    return {'message': 'Active plan not found', 'data': null};
    }
  } catch (error) {
    print('Error: $error');
        return {'message': 'error', 'data': null};
  }
}

List<List<int>> dayByDay = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]];

Future<List<List<int>>> WeekchartData(int user_id) async {
  try {
     dayByDay = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]];
  //  dayByDay.clear();
    int records = await weekData(); // 5 record minimum
    print('rrrrrrr: $records');
    Map<String, dynamic> record = await getActivePlan(user_id);
    await planController.dailyProgress();
    print('ttttr: $records');
     records=records-1;
     dayByDay[records]=([planController.doneCount.value, planController.tasksNumber.value]);
    print(dayByDay);
    if (records == 0) {
      for (int i = 0; i <= 6; i++) {
        if(i!=records){
        dayByDay[i]=[0, 0];}
      }
    } else {
      print("needweek");
      final weekDataMap = await fetchWeekData(user_id);
      if (weekDataMap != null && weekDataMap.containsKey('data')) {
        final weekDataM = weekDataMap['data'];
        print(weekDataM);
        
        if (weekDataM != null) { // Null check added here
          for (int i = 0; i < weekDataM.length; i++) {
            List<int> data = backUpCounters(i, weekDataM);
            final doneCount = data[0];
            final tasksNumber = data[1];
            dayByDay[records-1]=([doneCount, tasksNumber]);
            records--;
            if (records == 0) break;
          }
        }
      }
      /*while (dayByDay.length < 7) {
        dayByDay.add([0, 0]);
      }*/
    }
    print("ddd${dayByDay}");
    return dayByDay;
  } catch (error) {
    print('Error: $error');
    return dayByDay;
  }
}


List<int> backUpCounters(int j,dynamic weekData) {
final weekDataM = weekData;
final firstObject = weekDataM[j];
final firstObjectList = firstObject.values.toList();
print(firstObject);
  int taskNumber = 0;
  int count_done = 0;
  List<int> data = [];
  for (int i = 2; i <= 32; i++) {
    if (i <= 12 && (firstObjectList[i] == true || firstObjectList[i] == 1)) {
      taskNumber = taskNumber + 1;
      print(taskNumber);
    } else if (i > 12 && i <= 18) {
      if (i == 14 || i == 16 || i == 18) continue;
      else if (firstObjectList[i] == 'none' || firstObjectList[i] == false) continue;
      else {
        taskNumber = taskNumber + 1;
      }
    } else if (i > 18) {
      if (firstObjectList[i] == true)
        count_done = count_done + 1;
      else if (firstObjectList[i] != false && firstObjectList[i] != 0) {
        count_done = count_done + 1;
      }
    }
  }
  data.add(count_done);
  data.add(taskNumber);
  print('done: ${data[0]}');
  print('tasks: ${data[1]}');
  return data;
}

}




