import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../model/categorymodel.dart';

// ignore: non_constant_identifier_names
List<CategoryModel> CategoryList = [
  CategoryModel(
      title: "Smart trainer", image: AppImageAsset.question, onPressed: () {}),
  CategoryModel(
      title: "Smart recitation",
      image: AppImageAsset.quranCategory,
      onPressed: () {}),
  CategoryModel(
      title: "Quran",
      image: AppImageAsset.reading,
      onPressed: () {
        Get.toNamed(AppRoute.surahs);
      }),
  CategoryModel(title: "Qibla", image: AppImageAsset.qibla, onPressed: () {}),
  CategoryModel(
      title: "Tasbeeh", image: AppImageAsset.rosary, onPressed: () {}),
  CategoryModel(title: "Prayer", image: AppImageAsset.prayer, onPressed: () {}),
  CategoryModel(title: "Dhikr", image: AppImageAsset.duaa, onPressed: () {}),
];
