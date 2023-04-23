import 'dart:async';
import 'package:hijri/hijri_calendar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';

import '../core/constant/color.dart';


 abstract class PrayScreenController extends GetxController {
  Rx<Map<String, String>> prayerTimesmap = Rx<Map<String, String>>({});
  RxString formativeCurrentDate = ''.obs;
  RxString city = ''.obs;
  RxString formativeHijriDate = ''.obs;
  RxString formattedRemainingTime=''.obs;
  late PrayerTimes prayerTimesInstance;
  Rx<Prayer> nextPrayer = (Prayer.none).obs;
  Rx<int> currentPrayer = (0).obs;
  Rx<int> prayCounter=(0).obs;
  Rx<int> missedCounter=(0).obs;
  Rx<double> _prayCounter=(0.0).obs;
  List<RxBool> trackPraying = List.generate(6, (_) => false.obs);
  List<Rx<Color>> itemColors =List.generate(6, (_) => Colors.white.obs);
   List<RxBool> isAlarmOn = List.generate(6, (_) => false.obs);
  Future<void> getCurrentLocation();
  Future<void> PrayTimes();
  Future<void> updatePrayerTimes();
  Future<void> getNextPrayer();
  Future<void> TrackPray(int index,bool?val);
  Future<void> CompletedPray();
    final location = Rx<Position>(Position(
      latitude: 0.0,
      longitude: 0.0,
      altitude: 0.0,
      accuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0, heading: 0.0,
      timestamp: DateTime.fromMillisecondsSinceEpoch(0),
));
}
class PrayScreenControllerImp extends PrayScreenController{
  Timer? _timer;
  bool isFirstTime = true;
  final hijriCalendar = HijriCalendar.fromDate(DateTime.now());
  late Duration remainingTime ;
  DateTime nextPrayerTime=DateTime.now();
  StreamSubscription? _subscription;
  @override
  void onInit() {
    super.onInit();
    formativeCurrentDate.value=DateFormat('EEEE, d MMMM y').format(DateTime.now());
    formativeHijriDate.value = hijriCalendar.toFormat('dd MMMM yyyy');
    PrayTimes();
    getNextPrayer();
    getCurrentLocation() ;
    //getNextPrayer();
    if(formattedRemainingTime=='00:00:00'){
          getNextPrayer();
    }
    _timer = Timer.periodic(
      const Duration(days: 1),
      (_) => updatePrayerTimes(),
    );
  }
  @override
  void onClose() {
    super.onClose();
    _subscription?.cancel();
    _timer?.cancel();
  }
  //location permission
 
  //get current location function :
  @override
 Future<void> getCurrentLocation() async {
    try {
      // Get the user's current location
      final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      location.value = currentPosition;
      print('Current position: ${currentPosition.latitude}, ${currentPosition.longitude}');
      //city name 
      List<Placemark> placemarks = await placemarkFromCoordinates(
      currentPosition.latitude, currentPosition.longitude);
      Placemark placemark = placemarks[0];
      city.value="${placemark.locality!} ${placemark.street}";
      await PrayTimes();
    } catch (e) {
      print('Error getting current position: $e');
    }
  }
  //get praying time  function
  @override
  Future<void> PrayTimes() async {
    try {
      // Get the current location
      final currentPosition = location.value;
      if (currentPosition == null) {
        return;
      }
      //use the prayer_times package
      final coordinates = Coordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      final params = CalculationMethod.umm_al_qura.getParameters();
      
      final date= DateTime.now();
      final dateComponents = DateComponents(
        date.year,
        date.month,
        date.day,
      );
      //day.value = DateFormat('EEEE').format(date); // EEEE formats the day name
      prayerTimesInstance = PrayerTimes(
        coordinates,
        dateComponents,
        params,
      );
      prayerTimesmap.update((val){
        val!['Fajr'] = DateFormat.jm().format(prayerTimesInstance.fajr);
        val['Sunrise'] = DateFormat.jm().format(prayerTimesInstance.sunrise);
        val['Dhuhr'] = DateFormat.jm().format(prayerTimesInstance.dhuhr);
        val['Asr'] = DateFormat.jm().format(prayerTimesInstance.asr);
        val['Maghrib'] = DateFormat.jm().format(prayerTimesInstance.maghrib);
        val['Isha'] = DateFormat.jm().format(prayerTimesInstance.isha);
      });

    } catch (e) {
    }
  }
  @override
  Future<void> updatePrayerTimes() async {
    await PrayTimes();
  }
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
  @override
  Future<void> getNextPrayer()   async { 
      currentPrayer.value=prayerTimesInstance.currentPrayer().index-1;
      nextPrayerTime = prayerTimesInstance.timeForPrayer(prayerTimesInstance.nextPrayer())! ;
       _subscription = Stream.periodic(Duration(seconds: 1), (i) => i)
      .listen((_) async {
      Duration remainingTime = nextPrayerTime.difference(DateTime.now());
      formattedRemainingTime.value = formatDuration(remainingTime) ;
       if(formattedRemainingTime=='00:00:00'){
      await PrayTimes();
      await getNextPrayer();
    }
      });
      try {
      if(prayerTimesInstance.nextPrayer().name=='none')
      {
         nextPrayer.value= prayerTimesInstance.currentPrayer();
      }
      else{
        nextPrayer.value=prayerTimesInstance.nextPrayer();
      }
    } catch (e) {
    }
  }
   @override
  Future<void> TrackPray(index,val) async {
       for (int i = 0; i < trackPraying.length; i++) {
        if(index>currentPrayer.value||index==1){
          trackPraying[index].value==false;
        }
        else{
          trackPraying[index].value=val!;
        }
        if(val!=null){
           itemColors[index].value =val ? AppColor.black : Color.fromARGB(255, 80, 78, 78);
        }
       }
       update();
  }

  @override
  Future<void> CompletedPray() async{
    bool alreadyAdded = false;
    for(int i=0;i<5;i++) 
    {
      if(i<currentPrayer.value && i!=1){
      if(trackPraying[i].value==true) prayCounter.value++;
      else{
        missedCounter.value--;
      }
      }
    }
    _prayCounter.value= (prayCounter.value/5*100) ;
    update();
  }


   void toggleAlarm(int index) {
    if(index==1){return;}
    isAlarmOn[index].value = !isAlarmOn[index].value;
    update();
  }
  }

 

