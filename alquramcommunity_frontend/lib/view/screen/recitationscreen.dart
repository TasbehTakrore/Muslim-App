import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import '../../controller/recitationscreen_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/recitation/floatingbuttonsgroup.dart';
import '../widget/recitation/recitationqurancontent.dart';

class RecitationScreen extends GetView {
  const RecitationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    final RecitationScreenController recitationController =
        Get.put(RecitationScreenController());
    return WillPopScope(
        onWillPop: () async {
          recitationController.cancleTimer();
          Get.offAllNamed(AppRoute.home);

          return false;
        },
        child: Scaffold(
            floatingActionButton: const ResitationFloatingButtonsGroup(),
            backgroundColor: AppColor.grey,
            body: PageView.builder(
                onPageChanged: (index) {
                  //recitationController.emptyLists();
                  //recitationController.createLists();
                  recitationController.setReloadIcon();

                  recitationController.setPageIndex(index);
                  recitationController.cancleTimer();

                  // recitationController.setSurahPageData(index + 1, 0, index,
                  //   context, getSurahCountByPage(index + 1));
                  //recitationController.reStartPage();
                },
                controller: PageController(
                    initialPage: recitationController.getPageIndex()),
                reverse: recitationController.englishLang() ? true : false,
                scrollDirection: Axis.horizontal,
                itemCount: 604,
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
                          // context: context,
                          //indx: indexP,
                          indexP: indexP);
                })));
  }
}
