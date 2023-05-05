import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:alquramcommunity_frontend/controller/recitationscreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/quranconst.dart';
import '../../core/constant/routes.dart';
import '../widget/Quran/editquranthemedialog.dart';
import '../widget/Quran/quranpagecontent.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    // Get.put(QuranPageController());
    RecitationScreenController recitationScreenController =
        Get.put(RecitationScreenController());
    return GetBuilder<QuranPageController>(builder: (controller) {
      return WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(AppRoute.home);
            return false;
          },
          child: Scaffold(
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                    heroTag: "recitation",
                    backgroundColor: Color.fromARGB(0, 0, 0, 0),
                    //hoverColor: AppColor.light2Yellow,
                    elevation: 0,
                    child: SvgPicture.asset(
                      AppImageAsset.quranCategory,
                      width: 35,
                      height: 35,
                    ),
                    onPressed: () {
                      recitationScreenController
                          .changePageIndex(controller.getPageIndex() + 1);
                      Get.toNamed(AppRoute.recitation);
                    }),
                const SizedBox(height: 5),
                FloatingActionButton(
                    heroTag: "theme",
                    backgroundColor: AppColor.primaryColor,
                    child: const Icon(Icons.color_lens_outlined),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext b) {
                            return EditQuranThemeDialog();
                          });
                    }),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            backgroundColor: QuranConstant.backgroundColor.value,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomSlidingSegmentedControl<int>(
                    fixedWidth: MediaQuery.of(context).size.width / 2.05,
                    height: 39,
                    initialValue: controller.getIndex(),
                    children: {
                      1: Text('Page\'',
                          style: TextStyle(
                              color: controller.getIndex() != 1
                                  ? AppColor.black
                                  : Colors.white)),
                      2: Text('Detailes',
                          style: TextStyle(
                              color: controller.getIndex() != 2
                                  ? AppColor.black
                                  : Colors.white)),
                    },
                    decoration: BoxDecoration(
                      color: QuranConstant.backgroundColor.value,
                    ),
                    thumbDecoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    duration: const Duration(milliseconds: 300),
                    onValueChanged: (v) {
                      controller.changeIndex(v);
                    }),
                controller.getIndex() == 1
                    ? SizedBox(
                        width: MediaQuery.of(context).size.height,
                        height: MediaQuery.of(context).size.height - 80,
                        child: PageView.builder(
                            onPageChanged: (index) {
                              controller.changePageIndexAndSurahName(index);
                            },
                            controller: PageController(
                                initialPage: controller.getPageIndex()),
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
                    : Container(
                        height: 500,
                        color: Color.fromARGB(255, 244, 67, 54),
                      )
              ],
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
