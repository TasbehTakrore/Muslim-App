import 'package:alquramcommunity_frontend/controller/homescreen_controller.dart';
import 'package:alquramcommunity_frontend/controller/prayscreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../../controller/qiblascreen_controller.dart';
import '../../controller/thikrCatgController.dart';
import '../../core/constant/routes.dart';
import '../../view/screen/thikr.dart';
import '../../view/widget/recitation/listsurahcardrecitation.dart';
import '../../view/widget/recitation/smartrecitationdialog.dart';
import '../../view/screen/surahsdialog.dart';
import '../../view/widget/recitation/surahdialogrecitation.dart';
import '../../view/widget/trainer/trainerdialog.dart';
import '../model/front_models/categorymodel.dart';

HomeScreenControllerImp homeScreenController =
    Get.put(HomeScreenControllerImp());
PrayScreenControllerImp prayScreenController =
    Get.put(PrayScreenControllerImp());
ThikrCatgControllerImp thikrController = Get.put(ThikrCatgControllerImp());

// ignore: non_constant_identifier_names
List<CategoryModel> CategoryList = [
  CategoryModel(
      title: "تدريب",
      image: AppImageAsset.question,
      onPressedWidgetDialog: const TrainerDialog()),
  CategoryModel(
      title: "تسميع",
      image: AppImageAsset.quranCategory,
      onPressedWidgetDialog: const SurahsDialogRecitation()),
  CategoryModel(
      title: "قُرآن",
      image: AppImageAsset.reading,
      onPressedWidgetDialog: const SurahsDialog()),
  CategoryModel(
      title: "قِبلة",
      image: AppImageAsset.qibla,
      onPressed: () async {
        Get.toNamed(AppRoute.qibla);
      }),
  CategoryModel(
    title: "تَسْبيح",
    image: AppImageAsset.rosary,
    onPressed: () => Get.toNamed(AppRoute.tasbeeh),
    onPressedWidgetDialog: const TrainerDialog(),
  ),
  CategoryModel(
    title: "صلاة",
    image: AppImageAsset.prayer,
    onPressed: () async {
      await prayScreenController.checkLocationPermission();
      if (prayScreenController.denied.value == false) {
        await prayScreenController.getCurrentLocation();
        homeScreenController.changePage(5);
      }
    },
  ),
  CategoryModel(
      title: "أذكار",
      image: AppImageAsset.duaa,
      onPressed: () async {
        await thikrController.loadJSON_t();
        if (thikrController.followCounters.isEmpty) {
          await thikrController.fillFollow();
        }
        // thikrController.my();
        // await thikrController.dataaa();
        homeScreenController.changePage(6);
      })
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
