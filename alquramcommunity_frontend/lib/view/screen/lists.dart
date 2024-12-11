import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import '../../controller/lists_controller.dart';
import '../../core/constant/constants.dart';
import '../../core/constant/quranconst.dart';
import '../../core/constant/routes.dart';
import '../widget/Lists/mistakespart.dart';
import '../widget/Lists/versemarkpart.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final screenWidth = MediaQuery.of(context).size.width;
    final isLaptopScreen = screenWidth > AppConstatns.labtopScrenWidth;

    Get.put(ListsController());

    return GetBuilder<ListsController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(AppRoute.home);
          return false;
        },
        child: Container(
          padding: isLaptopScreen == true
              ? EdgeInsets.only(right: screenWidth / 11, left: screenWidth / 6)
              : EdgeInsets.all(6.0),
          child: ListView(
            //mainAxisSize: MainAxisSize.min,
            children: [
              CustomSlidingSegmentedControl<int>(
                  fixedWidth: isLaptopScreen == false
                      ? screenWidth / 1.05
                      : screenWidth / 1.37,
                  // fixedWidth: isLaptopScreen == true
                  //     ? screenWidth / 2.72
                  //     : screenWidth / 2.1,
                  height: 39,
                  initialValue: controller.getIndex(),
                  children: {
                    1: Text('أخطائي',
                        style: TextStyle(
                            color: controller.getIndex() != 1
                                ? AppColor.black
                                : Colors.white)),
                    // 2: Text('Versemarks',
                    //     style: TextStyle(
                    //         color: controller.getIndex() != 2
                    //             ? AppColor.black
                    //             : Colors.white)),
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
              //SizedBox(height: 10),
              controller.getIndex() == 1 ? MistakesPart() : VersemarksPart(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    });
  }
}



//                           // quranController.words
//                           //     .map((e) => Container(
//                           //           child: e,
//                           //           padding: EdgeInsets.all(2),
//                           //           color: Colors.lightBlue,
//                           //         ))
//                           //     .toList(),

//                           // child: ResponsiveGridList(
//                           //     desiredItemWidth: double.infinity,
//                           //     minSpacing: 10,
//                           //     children: [
//                           //       "بسم الله الرحمن الرحيمن",
//                           //       "بسم الله الرحمن الرحيمن",
//                           //       "K lhg; d,l hg]dkبسم الله الرحمن الرحيمن",
//                           //       "بسم الله الرحمن الرحيمن",
//                           //       "بسم الله الرحمن الرحيمن",
//                           //       "، مالك يوم الدين إياك، بسم الله الرحمن الرحيمن",
//                           //       "بسم الله الرحمن الرحيمن",
//                           //       "بسم الله الرحمن الرحيمن",
//                           //       "بسم الله الرحمن الرحيمن",
//                           //       "بسم الله الرحمن الرحيمن",
//                           //       "بسم الله الرحمن الرحيمن، مالك يوم الدين",
//                           //     ].map((i) {
//                           //       return Container(
//                           //         width: double.infinity,
//                           //         alignment: Alignment(0, 0),
//                           //         color: Colors.cyan,
//                           //         child: Text(i.toString()),
//                           //       );
//                           //     }).toList()),

//                           //     child: GridView.builder(
//                           //   shrinkWrap: true,
//                           //   itemCount: quranController.versesCount,
//                           //   itemBuilder: (context, index) => Text(
//                           //       "${getVerse(quranController.surahNumb!, index + 1)}"),
//                           //   gridDelegate:
//                           //       const SliverGridDelegateWithFixedCrossAxisCount(
//                           //     crossAxisCount: 3,
//                           //   ),
//                           // )

//                           // child: ListView.builder(
//                           //     shrinkWrap: true,
//                           //     itemBuilder: ((context, index) =>
//                           //         Text("tasbeeeeeeeeeeeeeh")
//                           //         )),     Text("tasbeeeeeeeeeeeeeh"))),
