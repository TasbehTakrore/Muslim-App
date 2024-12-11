import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:alquramcommunity_frontend/controller/recitationscreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import '../../core/constant/constants.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/quranconst.dart';
import '../../core/constant/routes.dart';
import '../widget/Quran/editquranthemedialog.dart';
import '../widget/Quran/quranFloatingButton.dart';
import '../widget/Quran/quranpagecontent.dart';
import '../widget/Quran/searchQuranDialog.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;

    RecitationScreenController recitationScreenController =
        Get.put(RecitationScreenController());

    return GetBuilder<QuranPageController>(builder: (controller) {
      controller.pageController =
          PageController(initialPage: controller.getPageIndex());
      controller.setContext(context);
      return WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(AppRoute.home);
            return false;
          },
          child: Scaffold(
            floatingActionButton: QuranFloatingButton(),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            backgroundColor: QuranConstant.backgroundColor.value,
            body: Container(
              // padding: EdgeInsets.all(50),
              //                   color: Colors.amber,
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height,
                    height: MediaQuery.of(context).size.height - 80,
                    child: PageView.builder(
                        onPageChanged: (index) {
                          controller.changePageIndexAndSurahName(index);
                        },
                        controller: controller.pageController,
                        reverse: controller.englishLang() ? true : false,
                        scrollDirection: Axis.horizontal,
                        itemCount: totalPagesCount,
                        itemBuilder: (context, indexP) {
                          return Container(
                              padding: indexP == 0 || indexP == 1
                                  ? const EdgeInsets.only(top: 150)
                                  : const EdgeInsets.only(top: 0),
                              child: QuranPageContent(indexP: indexP));
                        }),
                  )
                ],
              ),
            ),
          ));
    });
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
