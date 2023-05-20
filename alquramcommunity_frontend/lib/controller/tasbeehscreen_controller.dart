import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';

import '../core/services/services.dart';
import '../core/services/tasbeh_services.dart';
import 'auth/chartsController.dart';

MyServices myServices = Get.put(MyServices());
TasbehServices tasbehServices = Get.put(TasbehServices());
ChartsController chartsController = Get.put(ChartsController());

class TasbeehController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final player = AudioPlayer();

  late AnimationController controller;
  late Animation<Offset> animation;
  Rx<Color> prim = AppColor.primaryColor.obs;
  Rx<Color> Second = AppColor.secondaryColor.obs;
  Color? swap;
  @override
  void onInit() {
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    animation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0, 0), end: const Offset(0.5, 0.3)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0.5, 0.3), end: const Offset(1, 0.6)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: const Offset(1, 0.6), end: const Offset(1.3, 0.9)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween:
            Tween(begin: const Offset(1.3, 0.9), end: const Offset(1.5, 1.0)),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.bounceInOut,
    ));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();

        swap = prim.value;
        prim.value = Second.value;
        Second.value = swap!;
      }
    });
  }

  void playCollisionSound() async {
    print("hmmmmmmmm");
  }

  void onTap() {
    AudioPlayer().play(AssetSource('sounds/Beam.wav'));
    Future.delayed(Duration(milliseconds: 120)).then((value) {
      controller.forward();
    });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  List<String> tasbehTypes = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلّا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله",
    "أستغفر الله",
    "اللهمّ صلّ على محمّد"
  ];
  List<Rx<int>> tasbehValue = [
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
  ];

  int typeIndex = 0;
  getValue() {
    return tasbehValue[typeIndex].value;
  }

  changeValue() {
    tasbehValue[typeIndex].value += 1;
    update();
  }

  changeIteamIndex(String element) {
    typeIndex = tasbehTypes.indexOf(element);
    update();
  }

  gettasbeehtype() {
    return tasbehTypes[typeIndex];
  }

  Future<void> addTasbehCount() async {
    final userId = myServices.sharedPreferences.getInt("user_id")!;
    RxInt custom = 0.obs;
    print("Add Tasbeh Count &&&&&&&&&&& $userId");

    update();
    for (int i = 7; i < tasbehValue.length; i++) {
      custom.value = custom.value + tasbehValue[i].value;
    }
    final data = {
      'subhanAllah': tasbehValue[0].value,
      'alhamdulliah': tasbehValue[1].value,
      'LaIlahaElaAllah': tasbehValue[2].value,
      'AllahuAkbar': tasbehValue[3].value,
      'LaHawalaWalaQuwaElaBillah': tasbehValue[4].value,
      'AstagfirAllah': tasbehValue[5].value,
      'blessingsOnTheProphetMuhammad': tasbehValue[6].value,
      'custom': custom.value,
    };
    await tasbehServices.createTasbehEntry(userId, data);
    // chartsController.tasbehData.value = await chartsController.getTasbehData();
  }
}
