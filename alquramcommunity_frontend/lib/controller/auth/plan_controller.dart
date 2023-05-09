import 'dart:async';

import 'package:flutter/Material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/services/notificationServices.dart';
//import 'package:timezone/timezone.dart' as tz;
//import 'package:timezone/data/latest.dart' as tz;
import 'package:alquramcommunity_frontend/core/services/plan_services.dart';
import '../../core/services/services.dart';
MyServices myServices = Get.put(MyServices());
PlanServices planServices =Get.put(PlanServices());



class PlanController extends GetxController {
  Rx<bool> mainPrayCheckValue = false.obs;
  Rx<bool> fivePrayCheckValue = false.obs;
  Rx<bool> fivePrayVisibleValue = false.obs;
  Rx<bool> duhaCheckValue = false.obs;
  Rx<bool> duhaVisibleValue = false.obs;
  Rx<bool> qeiamCheckValue = false.obs;
  Rx<bool> qeiamVisibleValue = false.obs;
  Rx<bool> addFivePray = false.obs;
  Rx<bool> addDuha = false.obs;
  Rx<bool> addQeiam = false.obs;

  setQuranPlanCount(int val) {
    quranPlanCount = val;
    print("quranPlanCount: $quranPlanCount");
    update();
  }

  int quranPlanType = 0; // 0=>safha, 1=> hezb, 2=>juz
  int quranPlanCount = 2;
  int? minQuran = 1;
  int? maxQuran = 20;
  BoxBorder? safhaBorder = Border.all(color: AppColor.primaryColor, width: 2);
  Rx<bool> quranPlanVisible = false.obs;

  BoxBorder? hezbBorder;
  bool haveQuranPlan = false;

  BoxBorder? juzBorder;
  QuranVisibleFunc(int i) {
    if (i == 1) {
      quranPlanVisible.value = true;
      haveQuranPlan = true;
      quranPlanCheckValue.value = false;
    } else {
      mainQuranCheckValue.value = false;

      haveQuranPlan = false;
      quranPlanCount = 1;
      quranPlanVisible.value = false;
      haveQuranPlan = false;
    }
    update();
  }

  String getTypeQuranPlan() {
    if (quranPlanType == 0) {
      if (quranPlanCount == 1)
        return "صفحة واحدة يوميًّا";
      else if (quranPlanCount == 2) return "صفحتين  يوميًّا";
      return "$quranPlanCount صفحات يوميًّا";
    } else if (quranPlanType == 1) {
      if (quranPlanCount == 1)
        return "حزب واحد يوميًّا";
      else if (quranPlanCount == 2) return "حزبين  يوميًّا";
      return "$quranPlanCount أحزاب يوميًّا";
    } else if (quranPlanType == 2) {
      if (quranPlanCount == 1)
        return "جزء واحد يوميًّا";
      else if (quranPlanCount == 2) return "جزئين  يوميًّا";
      return "$quranPlanCount أجزاء يوميًّا";
    }
    return "";
  }

  safhaSettings() {
    quranPlanType = 0;
    safhaBorder = Border.all(color: AppColor.primaryColor, width: 2);
    hezbBorder = null;
    juzBorder = null;
    minQuran = 1;
    quranPlanCount = 1;
    maxQuran = 20;
    update();
  }

  hezbSettings() {
    quranPlanType = 1;
    hezbBorder = Border.all(color: AppColor.primaryColor, width: 2);
    juzBorder = null;
    safhaBorder = null;
    minQuran = 1;
    quranPlanCount = 1;

    maxQuran = 60;
    update();
  }

  juzSettings() {
    quranPlanType = 2;
    juzBorder = Border.all(color: AppColor.primaryColor, width: 2);
    hezbBorder = null;
    safhaBorder = null;
    minQuran = 1;
    quranPlanCount = 1;
    maxQuran = 30;
    update();
  }

  int prayPalnCount = 0;
  int prayPalnCheckCount = 0;
  addFivePrayFunc(bool val) {
    addFivePray.value = val;
    fivePrayVisibleValue.value = val;
    if (val == true)
      prayPalnCount++;
    else {
      prayPalnCount--;
      if (prayPalnCount == 0) mainPrayCheckValue.value = false;
    }
    update();
  }

  addDuhaFunc(bool val) {
    addDuha.value = val;
    duhaVisibleValue.value = val;
    if (val == true)
      prayPalnCount++;
    else {
      prayPalnCount--;
      if (prayPalnCount == 0) mainPrayCheckValue.value = false;
    }
    update();
  }

  addQeiamFunc(bool val) {
    addQeiam.value = val;
    qeiamVisibleValue.value = val;
    if (val == true)
      prayPalnCount++;
    else {
      prayPalnCount--;
      if (prayPalnCount == 0) mainPrayCheckValue.value = false;
    }
    update();
  }

  changeMainPrayCheck(bool val) {
    if (prayPalnCount > 0) {
      mainPrayCheckValue.value = val;
      fivePrayCheckValue.value = val;
      duhaCheckValue.value = val;
      qeiamCheckValue.value = val;
    }
    update();
  }

  changeFivePrayCheck(bool val) {
    fivePrayCheckValue.value = val;
    // if (val == true)
    //   prayPalnCheckCount++;
    // else
    //   prayPalnCheckCount--;
    // if (prayPalnCount > prayPalnCheckCount) mainPrayCheckValue.value = false;

    update();
  }

  changeDuhaCheck(bool val) {
    duhaCheckValue.value = val;
    update();
  }

  changeQeiamCheck(bool val) {
    qeiamCheckValue.value = val;
    update();
  }

  Rx<bool> mainThikrCheckValue = false.obs;
  Rx<bool> sapahThikrCheckValue = false.obs;
  Rx<bool> sapahThikrVisibleValue = false.obs;
  Rx<bool> addSapahThikr = false.obs;
  Rx<bool> masaThikrCheckValue = false.obs;
  Rx<bool> masaThikrVisibleValue = false.obs;
  Rx<bool> addmasaThikr = false.obs;
  Rx<bool> wakeUpCheckValue = false.obs;
  Rx<bool> wakeUpVisibleValue = false.obs;
  Rx<bool> addwakeUp = false.obs;

  Rx<bool> sleepCheckValue = false.obs;
  Rx<bool> sleepVisibleValue = false.obs;
  Rx<bool> addsleep = false.obs;

  // Rx<bool> duhaCheckValue = false.obs;
  // Rx<bool> duhaVisibleValue = false.obs;
  // Rx<bool> qeiamCheckValue = false.obs;
  // Rx<bool> qeiamVisibleValue = false.obs;
  // Rx<bool> addDuha = false.obs;
  // Rx<bool> addQeiam = false.obs;

  int thikrPalnCount = 0;

  changeMainThikrCheck(bool val) {
    print(thikrPalnCount);
    if (thikrPalnCount > 0) {
      mainThikrCheckValue.value = val;
      masaThikrCheckValue.value = val;
      sapahThikrCheckValue.value = val;
      wakeUpCheckValue.value = val;
      sleepCheckValue.value = val;
      adhanCheckValue.value = val;
      wodooCheckValue.value = val;
      salahThikrCheckValue.value = val;
      // qeiamCheckValue.value = val;
    }
    update();
  }

  addSapahThikeFunc(bool val) {
    addSapahThikr.value = val;
    sapahThikrVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
      // else if (thikrPalnCount < 7) mainPrayCheckValue.value = false;
    }
    update();
  }

  changeSapahThikrCheck(bool val) {
    sapahThikrCheckValue.value = val;
    update();
  }

  addmasaThikeFunc(bool val) {
    addmasaThikr.value = val;
    masaThikrVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changemasaThikrCheck(bool val) {
    masaThikrCheckValue.value = val;
    update();
  }

  addwakeUpFunc(bool val) {
    addwakeUp.value = val;
    wakeUpVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changewakeUpCheck(bool val) {
    wakeUpCheckValue.value = val;
    update();
  }

  addsleepFunc(bool val) {
    addsleep.value = val;
    sleepVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changesleepCheck(bool val) {
    sleepCheckValue.value = val;
    update();
  }

  Rx<bool> adhanCheckValue = false.obs;
  Rx<bool> adhanVisibleValue = false.obs;
  Rx<bool> addadhan = false.obs;

  addadhanFunc(bool val) {
    addadhan.value = val;
    adhanVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changeadhanCheck(bool val) {
    adhanCheckValue.value = val;
    update();
  }

  Rx<bool> wodooCheckValue = false.obs;
  Rx<bool> wodooVisibleValue = false.obs;
  Rx<bool> addwodoo = false.obs;

  addwodooFunc(bool val) {
    addwodoo.value = val;
    wodooVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changewodooCheck(bool val) {
    wodooCheckValue.value = val;
    update();
  }

  Rx<bool> salahThikrCheckValue = false.obs;
  Rx<bool> salahThikrVisibleValue = false.obs;
  Rx<bool> addsalahThikr = false.obs;

  addsalahThikrFunc(bool val) {
    addsalahThikr.value = val;
    salahThikrVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changesalahThikrCheck(bool val) {
    salahThikrCheckValue.value = val;
    update();
  }

  Rx<bool> mainQuranCheckValue = false.obs;
  void changeMainQuranCheck(bool bool) {
    if (bool == true && haveQuranPlan == false)
      mainQuranCheckValue.value = false;
    else {
      mainQuranCheckValue.value = bool;
      quranPlanCheckValue.value = bool;
    }

    update();
  }

  Rx<bool> quranPlanCheckValue = false.obs;
  void changequranPlanCheck(bool bool) {
    quranPlanCheckValue.value = bool;
    update();
  }

  Rx<bool> mainRecitationCheckValue = false.obs;
  Rx<bool> RecitationPlanCheckValue = false.obs;
  Rx<bool> RecitationPlanVisible = false.obs;
  bool haveRecitationPlan = false;

  Rx<bool> mainTadabborCheckValue = false.obs;
  Rx<bool> TadabborPlanCheckValue = false.obs;
  Rx<bool> TadabborPlanVisible = false.obs;

  void changeMainRecitationCheck(bool bool) {
    if (bool == true && haveRecitationPlan == false)
      mainRecitationCheckValue.value = false;
    else {
      mainRecitationCheckValue.value = bool;
      RecitationPlanCheckValue.value = bool;
    }
    update();
  }

  void changeRecitationPlanCheck(bool bool) {
    RecitationPlanCheckValue.value = bool;
    update();
  }

////////////////////////////////
  String getTypeRecitationPlan() {
    print("TadabborPlanType $TadabborPlanType");
    print("TadabborPlanCount $TadabborPlanCount");

    if (RecitationPlanCount == 1)
      return "صفحة واحدة يوميًّا";
    else if (RecitationPlanCount == 2) return "صفحتين  يوميًّا";
    return "$RecitationPlanCount صفحات يوميًّا";
  }

  int RecitationPlanCount = 1;
  void setQuranPlanCountRecitation(int value) {
    RecitationPlanCount = value;
    print("RecitationPlanCount: $RecitationPlanCount");
    update();
  }

  RecitationVisibleFunc(int i) {
    if (i == 1) {
      RecitationPlanVisible.value = true;
      haveRecitationPlan = true;
      RecitationPlanCheckValue.value = false;
    } else {
      mainRecitationCheckValue.value = false;

      haveRecitationPlan = false;
      RecitationPlanCount = 1;
      RecitationPlanVisible.value = false;
    }
    update();
  }

  void changeMainTadabborCheck(bool bool) {
    if (bool == true && haveTadabborPlan == false)
      mainTadabborCheckValue.value = false;
    else {
      mainTadabborCheckValue.value = bool;
      TadabborPlanCheckValue.value = bool;
    }

    update();
  }

  void changeTadabborPlanCheck(bool bool) {
    TadabborPlanCheckValue.value = bool;
    update();
  }

  bool haveTadabborPlan = false;
  int TadabborPlanCount = 1;
  TadabborVisibleFunc(int i) {
    if (i == 1) {
      TadabborPlanVisible.value = true;
      haveTadabborPlan = true;
      TadabborPlanCheckValue.value = false;
    } else {
      mainTadabborCheckValue.value = false;

      haveTadabborPlan = false;
      TadabborPlanCount = 1;
      TadabborPlanVisible.value = false;
    }
    update();
  }

  BoxBorder? juzBorderTadabbor;
  BoxBorder? safhaBorderTadabbor =
      Border.all(color: AppColor.primaryColor, width: 2);
  BoxBorder? hezbBorderTadabbor;
  int minQuranTadabbor = 1;
  int maxQuranTadabbor = 20;
  int TadabborPlanType = 0;
  juzSettingsTadabbor() {
    TadabborPlanType = 2;
    juzBorderTadabbor = Border.all(color: AppColor.primaryColor, width: 2);
    hezbBorderTadabbor = null;
    safhaBorderTadabbor = null;
    minQuranTadabbor = 1;
    TadabborPlanCount = 1;
    maxQuranTadabbor = 30;
    update();
  }

  hezbSettingsTadabbor() {
    TadabborPlanType = 1;
    hezbBorderTadabbor = Border.all(color: AppColor.primaryColor, width: 2);
    juzBorderTadabbor = null;
    safhaBorderTadabbor = null;
    minQuranTadabbor = 1;
    TadabborPlanCount = 1;

    maxQuranTadabbor = 60;
    update();
  }

  safhaSettingsTadabbor() {
    TadabborPlanType = 0;
    safhaBorderTadabbor = Border.all(color: AppColor.primaryColor, width: 2);
    hezbBorderTadabbor = null;
    juzBorderTadabbor = null;
    minQuranTadabbor = 1;
    TadabborPlanCount = 1;
    maxQuranTadabbor = 20;
    update();
  }

  void setQuranPlanCountTadabbor(int value) {
    TadabborPlanCount = value;
    print("TadabborPlanCount: $TadabborPlanCount");
    update();
  }

  String getTypeTadabborPlan() {
    print("TadabborPlanType $TadabborPlanType");
    print("TadabborPlanCount $TadabborPlanCount");

    if (TadabborPlanType == 0) {
      if (TadabborPlanCount == 1)
        return "صفحة واحدة يوميًّا";
      else if (TadabborPlanCount == 2) return "صفحتين  يوميًّا";
      return "$TadabborPlanCount صفحات يوميًّا";
    } else if (TadabborPlanType == 1) {
      if (TadabborPlanCount == 1)
        return "حزب واحد يوميًّا";
      else if (TadabborPlanCount == 2) return "حزبين  يوميًّا";
      return "$TadabborPlanCount أحزاب يوميًّا";
    } else if (TadabborPlanType == 2) {
      if (TadabborPlanCount == 1)
        return "جزء واحد يوميًّا";
      else if (TadabborPlanCount == 2) return "جزئين  يوميًّا";
      return "$TadabborPlanCount أجزاء يوميًّا";
    }
    return "";
  }

 // ****************************************************//
  @override
  void onInit()async {
    getRemainingTime();   
    await showPlantoUser();
    super.onInit();  
  }
    @override
  void onClose() {
    super.onClose();
    _subscription?.cancel();
  }

 //remaining time for plan 
  StreamSubscription? _subscription;
  DateTime  now = DateTime.now();
  DateTime endOfDay=  DateTime.now();
  RxString formattedRemainingTime = ''.obs;

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
  
  Future<int> getRemainingTime() async {
    try {
       endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);  
      _subscription =
        Stream.periodic(Duration(seconds: 1), (i) => i).listen((_) async {
        Duration remainingTime = endOfDay.difference(DateTime.now());
        formattedRemainingTime.value = formatDuration(remainingTime);
        if (formattedRemainingTime.value == '00:00:00') {
          dayEnd();
           
        }
      });
    } catch (e) {}
    return 0;
  }

  void dayEnd(){
    return;
  }
  //end of remaininy time 

  //add or update user plan function 
  List<dynamic> planData=[];
  int userId=0;
  RxInt tasksCount=0.obs;
  Future<void> getPlanFromUser()async{
    print('fron func: ${addFivePray.value}');
    planData.clear();
    tasksCount.value=0;
    planData.addAll([
      addFivePray.value,
      addDuha.value,
      addQeiam.value,
      false,//taraweeh
      addSapahThikr.value,
      addmasaThikr.value,
      addsleep.value,
      addwakeUp.value,
      addwodoo.value,
      addsalahThikr.value,
      addadhan.value,
      haveQuranPlan==false? 'none':(quranPlanType==0? 'page':(quranPlanType==1?'hizb':'juz')),
      haveQuranPlan==false? 0:quranPlanCount,
      haveTadabborPlan==false? 'none':(TadabborPlanType==0? 'page':(TadabborPlanType==1?'hizb':'juz')),
      haveTadabborPlan==false? 0:TadabborPlanCount,
      haveRecitationPlan==false? false:true,
      haveRecitationPlan==false?  0:RecitationPlanCount,
      ]);
      for(int i=0;i<planData.length;i++){
        if(i==11 ||i==13||i==15) continue;
        else{
          if(i<11&&planData[i]==true){
            tasksCount.value=tasksCount.value+1;
          }
          else if(i>11&&planData[i]!=0){
            tasksCount.value=tasksCount.value+1;
          }
        }
      }
    return;
  }
  Future<void> setUpdatePlan()async{
    userId = myServices.sharedPreferences.getInt("user_id")!;
    print("userid ${userId}\n");
    await getPlanFromUser();
    print('tasks #: ${tasksCount.value}');
    await planServices.updatePlan(userId,planData);

  }
  
  Future<void> showPlantoUser()async{
    print("inside show...");
    userId = myServices.sharedPreferences.getInt("user_id")!;
    Map<String, dynamic> activePlan = await planServices.getActivePlan(userId);
    if (activePlan != null && activePlan['data'] != null) {
      var dataValues = activePlan['data'].values.toList();
      print(dataValues);
      addFivePray.value=fivePrayVisibleValue.value=dataValues[1];
      addDuha.value=duhaVisibleValue.value=dataValues[2];
      addQeiam.value=qeiamVisibleValue.value=dataValues[3];
      addSapahThikr.value=sapahThikrVisibleValue.value=dataValues[5];
      addmasaThikr.value=masaThikrVisibleValue.value=dataValues[6];
      addsleep.value=sleepVisibleValue.value=dataValues[7];
      addwakeUp.value=wakeUpVisibleValue.value=dataValues[8];
      addwodoo.value=wodooVisibleValue.value=dataValues[9];
      addsalahThikr.value=salahThikrVisibleValue.value=dataValues[10];
      addadhan.value=adhanVisibleValue.value=dataValues[11];
      if(dataValues[12]=='none'){
        haveQuranPlan=false;
        QuranVisibleFunc(0);
      }
      else{
        haveQuranPlan=true;
        (dataValues[12]=='page'
        ? safhaSettings()
       :(dataValues[12]=='hizb')
       ?hezbSettings()
        :(dataValues[12]=='juz'
        ?juzSettings()
        :quranPlanType=3));
        quranPlanCount=(dataValues[13]) ;
        QuranVisibleFunc(1);
      }
      if(dataValues[14]=='none'){
        haveTadabborPlan=false;
        TadabborVisibleFunc(0);
      }
      else{
        haveTadabborPlan=true;
        (dataValues[14]=='page'
      ?safhaSettingsTadabbor()
       :((dataValues[14]=='hizb'
       ?hezbSettingsTadabbor()
        :((dataValues[14]=='juz'
        ? juzSettingsTadabbor()
         :TadabborPlanType=3)))
        ));
        TadabborPlanCount=(dataValues[15]) ;
        TadabborVisibleFunc(1);
      }
      if(dataValues[16]==false){
        haveRecitationPlan=false;
        RecitationVisibleFunc(0);
      }
      else{
        haveRecitationPlan=true;
        RecitationVisibleFunc(1);
        RecitationPlanCount=(dataValues[17]);
      }
      update();

    }
    else{
      return;
    }


  }

}
