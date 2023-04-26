import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controller/homescreen_controller.dart';
import '../../controller/thikrCatgController.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../data/model/front_models/thikrmodel.dart';
import '../widget/home/customappbar.dart';
import '../widget/home/custombottomappbarhome.dart';
import '../widget/thikr/ThikrDataCard.dart';
import '../widget/thikr/ThikrCardBottom.dart';

class ThikrDetails extends GetView<ThikrCatgControllerImp> {
  const ThikrDetails({super.key});
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    //WidgetsFlutterBinding.ensureInitialized();
    //SystemChrome.setEnabledSystemUIOverlays([]);
    ThikrCatgControllerImp thikrCatgController =
        Get.put(ThikrCatgControllerImp());
    HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
    thikrCatgController.onInit();
    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoute.home);

          // print('Back button pressed!');
          //Get.toNamed(AppRoute.home);
          return true; // Return true to allow navigation, false to prevent it
        },
        child: Scaffold(
          // floatingActionButton: FloatingActionButton(
          //     backgroundColor: AppColor.primaryColor,
          //     onPressed: () {
          //       homeScreenControllerImp.changePage(4);
          //     },
          //     child: const Icon(Icons.home)),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // backgroundColor: AppColor.primaryColor,
          // bottomNavigationBar: const CustomBottonAppBarHome(),
          // appBar: AppBar(
          //     shadowColor: AppColor.grey,
          //     automaticallyImplyLeading: false,
          //     //primary: true,
          //     elevation: 0.0,
          //     backgroundColor: AppColor.grey,
          //     title: CustomAppBar(onPressedIcon: () {})
          //     //titleTextStyle: TextStyle(text),
          //     ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImageAsset.mosque),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
                // borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff266f52), Color(0xff266f52)],
                )),
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.bottom,
            child: Column(
              children: [
                //SizedBox(height: 10),
                // CustomAppBar(onPressedIcon: () {}),
                Expanded(
                  child: FutureBuilder(
                    future: thikrCatgController.loadJSON(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else if (snapshot.hasData) {
                        var section = snapshot.data;
                        thikrCatgController.my();
                        final data = List<Thikr>.from(
                            section["Thikr"].map((x) => Thikr.fromJson(x)));
                        return GetBuilder<ThikrCatgControllerImp>(
                            init: ThikrCatgControllerImp(),
                            builder: (thikrCatgController) {
                              return ListView.builder(
                                itemCount:
                                    section.length == 0 ? 0 : section.length,
                                itemBuilder: (context, index) {
                                  if (data != null) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: ListView.builder(
                                        itemCount: data[thikrCatgController
                                                .selectedThikr]
                                            .tEXT!
                                            .length,
                                        itemBuilder: (BuildContext context, i) {
                                          final repeatCount = data[
                                                  thikrCatgController
                                                      .selectedThikr]
                                              .tEXT![i]
                                              .rEPEAT!
                                              .obs;

                                          thikrCatgController.countersList[
                                                  thikrCatgController
                                                      .selectedThikr][i] =
                                              repeatCount;

                                          return GetBuilder<
                                                  ThikrCatgControllerImp>(
                                              builder: (thikrCatgController) {
                                            return ThikrDataCardArabic(
                                              arabicText: data[
                                                      thikrCatgController
                                                          .selectedThikr]
                                                  .tEXT![i]
                                                  .aRABICTEXT
                                                  .toString(),
                                              Catg: index,
                                              subCatg: i,
                                            );
                                          });
                                        },
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              );
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
