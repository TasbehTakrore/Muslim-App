import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import '../../core/constant/routes.dart';
import '../widget/Quran/quranpagecontent.dart';

class QuranScreen extends GetView {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuranPageController quranController = Get.put(QuranPageController());
    return WillPopScope(
        onWillPop: () async {
          // print('Back button pressed!');
          Get.toNamed(AppRoute.home);
          return false; // Return true to allow navigation, false to prevent it
        },
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.settings), onPressed: () {}),
            backgroundColor: const Color.fromARGB(255, 255, 249, 240),
            body: PageView.builder(
                onPageChanged: (index) {
                  quranController.changePageIndexAndSurahName(index);
                },
                controller:
                    PageController(initialPage: quranController.getPageIndex()),
                reverse: quranController.englishLang() ? true : false,
                scrollDirection: Axis.horizontal,
                itemCount: totalPagesCount,
                itemBuilder: (context, indexP) {
                  return QuranPageContent(indexP: indexP);
                })));
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
