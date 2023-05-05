/*
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controller/homescreen_controller.dart';
import '../../controller/thikrCatgController.dart';
import '../../core/constant/imageasset.dart';
import '../../data/model/front_models/thikrmodel.dart';
import '../widget/thikr/ThikrDataCard.dart';

class ThikrDetails extends GetView<ThikrCatgControllerImp> {
  const ThikrDetails({super.key});
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    ThikrCatgControllerImp thikrCatgController =
        Get.put(ThikrCatgControllerImp());
    HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
                                thikrCatgController.my();

    thikrCatgController.onInit();
    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoute.home);
          return true; // Return true to allow navigation, false to prevent it
        },
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImageAsset.mosque),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
                // borderRadius: BorderRadius.circular(20),
                gradient:  LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff266f52), Color(0xff266f52)],
                )),
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.bottom,
                
            child: Column(
              children: [
                Expanded(
                        child: GetBuilder<ThikrCatgControllerImp>(
                            init: ThikrCatgControllerImp(),
                            builder: (thikrCatgController) {
                              return ListView.builder(
                                itemCount:7
                                itemBuilder: (context, index) {
                                  if (data != null) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: ListView.builder(
                                        itemCount: data[thikrCatgController.selectedThikr.value]
                                            .tEXT!
                                            .length,
                                        itemBuilder: (BuildContext context, i) {
                                          final repeatCount = data[
                                                  thikrCatgController.selectedThikr.value].tEXT![i].rEPEAT!;

                                          thikrCatgController.countersList[
                                                  thikrCatgController.selectedThikr.value][i] =
                                              repeatCount;
                                          return GetBuilder<
                                                  ThikrCatgControllerImp>(
                                              builder: (thikrCatgController) {
                                            return ThikrDataCardArabic(
                                              arabicText: data[
                                                      thikrCatgController.selectedThikr.value].tEXT![i]
                                                  .aRABICTEXT
                                                  .toString(),
                                              Catg: index,
                                              subCatg: i,
                                            );
                                          });
                                        },
                                      ),
                                    );
                                  } 
                                },
                              );
                            })
  
                ),]),)),);}

  
  
  
  

                    }
                  
*/
