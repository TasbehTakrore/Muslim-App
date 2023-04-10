import 'package:alquramcommunity_frontend/controller/homescreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../view/screen/thikr.dart';
import '../../view/widget/recitation/smartrecitationdialog.dart';
import '../../view/screen/surahsdialog.dart';
import '../model/front_models/categorymodel.dart';

HomeScreenControllerImp homeScreenController =
    Get.put(HomeScreenControllerImp());
// ignore: non_constant_identifier_names
List<CategoryModel> CategoryList = [
  CategoryModel(
      title: "Smart trainer",
      image: AppImageAsset.question,
      onPressedWidgetDialog: Text("Test")),
  CategoryModel(
      title: "Smart recitation",
      image: AppImageAsset.quranCategory,
      onPressedWidgetDialog: SmartRecitationDialog()),
  CategoryModel(
      title: "Quran",
      image: AppImageAsset.reading,
      onPressedWidgetDialog: const SurahsDialog()),
  CategoryModel(
    title: "Qibla",
    image: AppImageAsset.qibla,
    onPressedWidgetDialog: Text("Test"),
  ),
  CategoryModel(
      title: "Tasbeeh",
      image: AppImageAsset.rosary,
      onPressedWidgetDialog: Text("Test")),
  CategoryModel(
      title: "Prayer",
      image: AppImageAsset.prayer,
      onPressedWidgetDialog: Text("")
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return CategoryList[index].onPressedWidget!;
      //     ;
      //   },
      // );
      ),
  CategoryModel(
    title: "Dhikr",
    image: AppImageAsset.duaa,
    onPressed: () => homeScreenController.changePage(5),
  )
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
