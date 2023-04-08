import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/Material.dart';
import '../../view/widget/recitation/smartrecitationdialog.dart';
import '../../view/screen/surahsdialog.dart';
import '../model/categorymodel.dart';

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
      title: "Dhikr", image: AppImageAsset.duaa, onPressedWidget: Text("Test")),
];
