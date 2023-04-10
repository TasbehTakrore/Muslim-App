import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../view/screen/thikr.dart';
import '../../view/widget/recitation/smartrecitationdialog.dart';
import '../../view/screen/surahsdialog.dart';
import '../model/front_models/categorymodel.dart';

// ignore: non_constant_identifier_names
List<CategoryModel> CategoryList = [
  CategoryModel(
      title: "Smart trainer",
      image: AppImageAsset.question,
      onPressedWidget: Text("Test")),
  CategoryModel(
      title: "Smart recitation",
      image: AppImageAsset.quranCategory,
      onPressedWidget: SmartRecitationDialog()),
  CategoryModel(
      title: "Quran",
      image: AppImageAsset.reading,
      onPressedWidget: const SurahsDialog()),
  CategoryModel(
    title: "Qibla",
    image: AppImageAsset.qibla,
    onPressedWidget: Text("Test"),
  ),
  CategoryModel(
      title: "Tasbeeh",
      image: AppImageAsset.rosary,
      onPressedWidget: Text("Test")),
  CategoryModel(
      title: "Prayer",
      image: AppImageAsset.prayer,
      onPressedWidget: Text("Test")),
  CategoryModel(
      title: "Dhikr", image: AppImageAsset.duaa, onPressedWidget: Thikr())
];

List<CategoryModel> ThikrCategoryList = [
  CategoryModel(
    title: "أذْكارُ الصباح والمساء",
    image: AppImageAsset.quranLogo,
    //     onPressed: () {
    //       Get.toNamed(AppRoute.surahs);
    // }
  ),
  CategoryModel(
    title: "أذْكارُ الاستيقاظ",
    image: AppImageAsset.quranLogo,
  ),
  CategoryModel(
    title: "أذْكارُ الصّلاة",
    image: AppImageAsset.quranLogo,
  ),
  CategoryModel(
    title: "أَذْكار الوضوء",
    image: AppImageAsset.quranLogo,
  ),
  CategoryModel(
    title: "أَذْكار مُتَفرِّقة",
    image: AppImageAsset.quranLogo,
  ),
  CategoryModel(
    title: "أذْكارُ النّوم",
    image: AppImageAsset.quranLogo,
  ),
];
