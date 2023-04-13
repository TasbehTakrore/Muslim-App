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

//athkar main category models 
List<CategoryModel> ThikrCategoryList = [
  CategoryModel(
    //morning
    title: "23".tr,
    image: AppImageAsset.morning,
  ),
  CategoryModel(
    //evening
    title: "24".tr,
    image: AppImageAsset.evening,
  ),
  CategoryModel(
    //walking up
    title: "25".tr,
    image: AppImageAsset.wakeup,
  ),
  CategoryModel(
    //sleeping
    title: "26".tr,
    image: AppImageAsset.sleep,
  ),
  CategoryModel(
    //Athan
    title: "27".tr,
    image: AppImageAsset.athan,
  ),
  CategoryModel(
    //wudu
    title: "28".tr,
    image: AppImageAsset.wudu,
  ),
  CategoryModel(
    //pray
    title: "29".tr,
    image: AppImageAsset.praying,
  ),
  CategoryModel(
    //other
    title: "30".tr,
    image: AppImageAsset.dua,
  ),
];
