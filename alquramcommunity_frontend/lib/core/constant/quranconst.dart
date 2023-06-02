import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class QuranConstant {
  static List<Color> backgroundColors = [
    Colors.white,
    Color(0xfffff9f1),
    Color.fromARGB(255, 249, 231, 207),
    Color.fromARGB(255, 47, 47, 47)
  ];
  static Rx<Color> backgroundColor = backgroundColors[1].obs;
  static Rx<Color> fontColor = Colors.black.obs;
  static Rx<Color> symbolColor = Color.fromARGB(255, 41, 119, 97).obs;
  static Rx<bool> showMistake = true.obs;
  static Rx<double> fontsize = 22.0.obs;
}
