import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../controller/recitationscreen_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/recitation/floatingbuttonsgroup.dart';
import '../widget/recitation/recitationqurancontent.dart';

class RecitationScreen extends GetView {
  const RecitationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecitationScreenController recitationController =
        Get.put(RecitationScreenController());
//final PageController _pageController = PageController();
// final PageController _pageController = PageController();

    return WillPopScope(
        onWillPop: () async {
          Get.toNamed(AppRoute.home);
          return false;
        },
        child: Scaffold(
            floatingActionButton: const ResitationFloatingButtonsGroup(),
            backgroundColor: AppColor.grey,
            body: PageView.builder(
                onPageChanged: (index) {
                  recitationController.setPageIndex(index);
                  // quranController.changePageIndexAndSurahName(index);
                },
                controller: recitationController.pageController,
                reverse: recitationController.englishLang() ? true : false,
                scrollDirection: Axis.horizontal,
                itemCount: recitationController.getTotalPageCount(),
                itemBuilder: (context, indexP) {
                  return
                      // Column(children: [
                      //   Text("$indexP"),
                      //   ElevatedButton(
                      //     child: Text("test"),
                      //     onPressed: () {
                      //       recitationController.goToNextPage();
                      //     },
                      //   )
                      // ]);
                      RecitationPageContent(
                          context: context,
                          indx: indexP,
                          indexP:
                              indexP + recitationController.getStartPage() - 1);
                })));
  }
}
