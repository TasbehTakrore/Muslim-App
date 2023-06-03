import 'dart:async';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import '../core/constant/color.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:audioplayers/audioplayers.dart';

abstract class PrayScreenController extends GetxController {
  Rx<Map<String, String>> prayerTimesmap = Rx<Map<String, String>>({});
  RxString city = ''.obs;
  RxString formativeHijriDate = ''.obs;
  RxString formattedRemainingTime = ''.obs;
  late PrayerTimes prayerTimesInstance;
  late PrayerTimes prayerTimesInstanceNxt;
  Rx<Prayer> nextPrayer = (Prayer.none).obs;
  Rx<int> currentPrayer = (0).obs;
  Rx<int> prayCounter = (0).obs;
  Rx<int> missedCounter = (0).obs;
  Rx<int> remain = (0).obs;
  Rx<double> _prayCounter = (0.0).obs;
  List<RxBool> trackPraying = List.generate(6, (_) => false.obs);
  List<Rx<Color>> itemColors = List.generate(6, (_) => Colors.white.obs);
  List<RxBool> isAlarmOn = List.generate(6, (_) => false.obs);
  Future<void> getCurrentLocation();
  Future<void> PrayTimes();
  Future<void> updatePrayerTimes();
  Future<void> getNextPrayer();
  Future<void> TrackPray(int index, bool? val);
  Future<void> CompletedPray();
  final location = Rx<Position>(Position(
    latitude: 0.0,
    longitude: 0.0,
    altitude: 0.0,
    accuracy: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    heading: 0.0,
    timestamp: DateTime.fromMillisecondsSinceEpoch(0),
  ));
}

class PrayScreenControllerImp extends PrayScreenController {
  late AudioPlayer audioPlayer;
  RxString formativeCurrentDate = ''.obs;
  bool isFirstTime = true;
  late Duration remainingTime;
  DateTime nextPrayerTime = DateTime.now();
  StreamSubscription? _subscription;

  String changePrayToArabic(String prayEnglish) {
    if (prayEnglish == "Maghrib")
      return "المغرب";
    else if (prayEnglish.capitalizeFirst == "Isha")
      return "العشاء";
    else if (prayEnglish.capitalizeFirst == "Asr")
      return "العصر";
    else if (prayEnglish.capitalizeFirst == "Dhuhr")
      return "الظّهر";
    else if (prayEnglish.capitalizeFirst == "Fajr")
      return "الفجر";
    else if (prayEnglish.capitalizeFirst == "Sunrise")
      return "شروق الشمس";
    else
      return "";
  }

  changeTimeToArabic(String time) {
    var inputFormat = DateFormat('h:mm a');
    var outputFormat = DateFormat.jm('ar');

    var dateTime = inputFormat.parse(time);
    var formattedTime = outputFormat.format(dateTime);
    print("formattedTime: $formattedTime");
    return formattedTime;
  }

  @override
  void onInit() async {
    super.onInit();
    audioPlayer = AudioPlayer();
    await getCurrentLocation();
    if (formattedRemainingTime == '00:00:00') {
      getNextPrayer();
    }

    /* FirebaseMessaging.instance.getToken().then((value){
    print('hi token :$value');
}

);*/
  }

  @override
  void onClose() {
    super.onClose();
    audioPlayer.dispose();
    _subscription?.cancel();
  }

  RxBool inUse = false.obs;
  RxBool denied = false.obs;
  //location permission
  Future<void> checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    inUse.value = false;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Geolocator.openLocationSettings();
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        denied.value = true;
        LocatioDialog();
        return;
      }
      denied.value = false;
      return;
    }
  }

  void LocatioDialog() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.error,
      title: ' Location Permission Required ',
      desc: 'Please allow location access to get prayer times.',
      btnOkText: 'Grant Permission',
      btnOkColor: AppColor.primaryColor,
      btnCancelText: 'Cancel',
      btnOkOnPress: () async {
        await Geolocator.openAppSettings();
        await checkLocationPermission();
      },
      btnCancelOnPress: () => Get.back(),
    ).show();
  }

  //get current location function :
  @override
  Future<void> getCurrentLocation() async {
    try {
      final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      location.value = currentPosition;
      print(
          'Current position cont: ${currentPosition.latitude}, ${currentPosition.longitude}');
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);
      Placemark placemark = placemarks[0];
      city.value = "${placemark.locality!} ${placemark.street}";
      print(city.value);
      await PrayTimes();
    } catch (e) {
      print('Error getting current position: $e');
    }
  }

  void updateDate() {
    initializeDateFormatting('ar');

    HijriCalendar.setLocal("ar"); // تحديد لغة الهجري
    // HijriCalendar.setAdjustments("UmmAlQura");
    final hijriCalendar = HijriCalendar.fromDate(DateTime.now());
    formativeCurrentDate.value =
        DateFormat('EEEE, d MMMM y', 'ar').format(DateTime.now());

    formativeHijriDate.value = hijriCalendar.toFormat('dd MMMM yyyy');
  }

  //get praying time  function
  @override
  Future<void> PrayTimes() async {
    try {
      final currentPosition = location.value;
      if (currentPosition == null) {
        return;
      }
      updateDate();
      final coordinates = Coordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      final params = CalculationMethod.umm_al_qura.getParameters();
      final date = DateTime.now();
      final dateComponents = DateComponents(
        date.year,
        date.month,
        date.day,
      );
      final dateNxt = DateTime.now().add(Duration(days: 1));
      final dateComponentsNxt = DateComponents(
        dateNxt.year,
        dateNxt.month,
        dateNxt.day,
      );
      prayerTimesInstance = PrayerTimes(
        coordinates,
        dateComponents,
        params,
      );
      currentPrayer.value = prayerTimesInstance.currentPrayer().index - 1;

      prayerTimesInstanceNxt = PrayerTimes(
        coordinates,
        dateComponentsNxt,
        params,
      );
      getNextPrayer();
      prayerTimesmap.update((val) {
        val!['Fajr'] = DateFormat.jm().format(prayerTimesInstance.fajr);
        val['Sunrise'] = DateFormat.jm().format(prayerTimesInstance.sunrise);
        val['Dhuhr'] = DateFormat.jm().format(prayerTimesInstance.dhuhr);
        val['Asr'] = DateFormat.jm().format(prayerTimesInstance.asr);
        val['Maghrib'] = DateFormat.jm().format(prayerTimesInstance.maghrib);
        val['Isha'] = DateFormat.jm().format(prayerTimesInstance.isha);
      });
    } catch (e) {
      print(e);
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
  Future<int> getNextPrayer() async {
    bool nxt = false;
    try {
      if (prayerTimesInstance.nextPrayer().name == 'none') {
        nextPrayer.value = Prayer.fajr;
        nextPrayerTime = prayerTimesInstanceNxt.fajr;
        nxt = true;
      } else {
        nextPrayer.value = prayerTimesInstance.nextPrayer();
        nextPrayerTime = prayerTimesInstance
            .timeForPrayer(prayerTimesInstance.nextPrayer())!;
      }
      _subscription =
          Stream.periodic(Duration(seconds: 1), (i) => i).listen((_) async {
        Duration remainingTime = nextPrayerTime.difference(DateTime.now());
        formattedRemainingTime.value = formatDuration(remainingTime);
        if (formattedRemainingTime == '00:00:00') {
          await PrayTimes();
          await getNextPrayer();
        }
        updateDate();
      });
      return 0;
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<void> TrackPray(index, val) async {
    for (int i = 0; i < trackPraying.length; i++) {
      if (index > currentPrayer.value || index == 1) {
        trackPraying[index].value == false;
      } else {
        trackPraying[index].value = val!;
      }
      if (val != null) {
        itemColors[index].value =
            val ? AppColor.black : Color.fromARGB(255, 80, 78, 78);
      }
    }
    update();
  }

  @override
  Future<void> CompletedPray() async {
    _prayCounter.value = 0.0;
    prayCounter.value = 0;
    missedCounter.value = 0;
    remain.value = 0;
    for (int i = 0; i <= 5; i++) {
      if (i == 1) continue;
      if (i <= currentPrayer.value) {
        if (trackPraying[i].value == true)
          prayCounter.value++;
        else {
          missedCounter.value++;
        }
      } else {
        remain.value++;
      }
    }
    _prayCounter.value = (prayCounter.value / 5 * 100);
    update();
  }

  void toggleAlarm(int index) {
    if (index == 1) {
      return;
    }
    isAlarmOn[index].value = !isAlarmOn[index].value;
    update();
  }

  final latitude = (0.0).obs;
  final longitude = (0.0).obs;
  final qiblaDirection = 0.0.obs;

  double calculateQiblaDirection(double latitude, double longitude) {
    getCurrentLocation();
    final direction = location.value;
    final coordinatesq = Coordinates(
      direction.latitude,
      direction.longitude,
    );
    final qiblaDirection = Qibla(coordinatesq);
    return qiblaDirection.direction;
  }
}
