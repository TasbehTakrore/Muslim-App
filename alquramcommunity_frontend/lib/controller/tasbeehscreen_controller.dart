import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';

class TasbeehController extends GetxController
    with GetSingleTickerProviderStateMixin {
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
      duration: const Duration(milliseconds: 300),
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
            Tween(begin: const Offset(1.3, 0.9), end: const Offset(1.6, 1.2)),
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

  void onTap() {
    controller.forward();
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
}
