import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/homescreen_controller.dart';
import '../../controller/thikrCatgController.dart';
import '../../core/constant/color.dart';
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
    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoute.home);
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

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
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff266f52), Color(0xff266f52)],
                )),
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.bottom,
            child:
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Text(
                //       " مُسْلم",
                //       style: GoogleFonts.elMessiri(
                //           fontWeight: FontWeight.w600,
                //           //fontWeight: FontWeight.w500,
                //           color: Color.fromARGB(255, 255, 255, 255),
                //           fontSize: 35),
                //     ),
                //     SizedBox(
                //       height: 25,
                //     ),
                //     Text(
                //       " كلّ ما تحتاجه في مكانٍ واحد!",
                //       style: GoogleFonts.elMessiri(
                //           fontWeight: FontWeight.w600,
                //           //fontWeight: FontWeight.w500,
                //           color: Color.fromARGB(255, 255, 255, 255),
                //           fontSize: 20),
                //     ),
                //     SizedBox(
                //       height: 140,
                //     ),
                //   ],
                // )

                Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: thikrCatgController.loadJSON_t(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else if (snapshot.hasData) {
                        var section = snapshot.data;
                        final data = List<Thikr>.from(controller
                            .jsonResponse["Thikr"]
                            .map((x) => Thikr.fromJson(x)));
                        return ListView.builder(
                          itemCount: section.length == 0 ? 0 : section.length,
                          itemBuilder: (context, index) {
                            if (data != null) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  itemCount: data[thikrCatgController
                                          .selectedThikr.value]
                                      .tEXT!
                                      .length,
                                  itemBuilder: (BuildContext context, i) {
                                    return GetBuilder<ThikrCatgControllerImp>(
                                        builder: (thikrCatgController) {
                                      return ThikrDataCardArabic(
                                        arabicText: data[thikrCatgController
                                                .selectedThikr.value]
                                            .tEXT![i]
                                            .aRABICTEXT
                                            .toString(),
                                        subCatg: controller.followCounters[
                                                controller.selectedThikr.value]
                                                [i]
                                            .toString(),
                                        catg: i,
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
