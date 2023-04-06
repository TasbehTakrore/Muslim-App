import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/core/constant/routes.dart';
import 'package:alquramcommunity_frontend/view/screen/surahs.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../core/localization/changelocal.dart';
import '../widget/Quran/quranpagecontent.dart';
import '../widget/home/customappbar.dart';

class QuranScreen extends GetView {
  //final int pageIndex = 0;

  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController localeController = Get.put(LocaleController());
    final QuranPageController quranController = Get.put(QuranPageController());
    return WillPopScope(
        onWillPop: () async {
          print('Back button pressed!');
          Get.back();
          return false; // Return true to allow navigation, false to prevent it
        },
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 249, 240),
            body: ListView(children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  height: 900,
                  child: PageView.builder(
                      onPageChanged: (index) {
                        quranController.changePageIndexAndSurahName(index);
                      },
                      controller: PageController(
                          initialPage: quranController.getPageIndex()),
                      reverse: localeController.myServices.sharedPreferences
                                  .getString("lang") ==
                              "en"
                          ? true
                          : false,
                      scrollDirection: Axis.horizontal,
                      itemCount: totalPagesCount,
                      itemBuilder: (context, indexP) {
                        return QuranPageContent(indexP: indexP);
                      }))
            ])));
  }
}



                          // quranController.words
                          //     .map((e) => Container(
                          //           child: e,
                          //           padding: EdgeInsets.all(2),
                          //           color: Colors.lightBlue,
                          //         ))
                          //     .toList(),

                          // child: ResponsiveGridList(
                          //     desiredItemWidth: double.infinity,
                          //     minSpacing: 10,
                          //     children: [
                          //       "بسم الله الرحمن الرحيمن",
                          //       "بسم الله الرحمن الرحيمن",
                          //       "K lhg; d,l hg]dkبسم الله الرحمن الرحيمن",
                          //       "بسم الله الرحمن الرحيمن",
                          //       "بسم الله الرحمن الرحيمن",
                          //       "، مالك يوم الدين إياك، بسم الله الرحمن الرحيمن",
                          //       "بسم الله الرحمن الرحيمن",
                          //       "بسم الله الرحمن الرحيمن",
                          //       "بسم الله الرحمن الرحيمن",
                          //       "بسم الله الرحمن الرحيمن",
                          //       "بسم الله الرحمن الرحيمن، مالك يوم الدين",
                          //     ].map((i) {
                          //       return Container(
                          //         width: double.infinity,
                          //         alignment: Alignment(0, 0),
                          //         color: Colors.cyan,
                          //         child: Text(i.toString()),
                          //       );
                          //     }).toList()),

                          //     child: GridView.builder(
                          //   shrinkWrap: true,
                          //   itemCount: quranController.versesCount,
                          //   itemBuilder: (context, index) => Text(
                          //       "${getVerse(quranController.surahNumb!, index + 1)}"),
                          //   gridDelegate:
                          //       const SliverGridDelegateWithFixedCrossAxisCount(
                          //     crossAxisCount: 3,
                          //   ),
                          // )

                          // child: ListView.builder(
                          //     shrinkWrap: true,
                          //     itemBuilder: ((context, index) =>
                          //         Text("tasbeeeeeeeeeeeeeh")
                          //         )),     Text("tasbeeeeeeeeeeeeeh"))),
