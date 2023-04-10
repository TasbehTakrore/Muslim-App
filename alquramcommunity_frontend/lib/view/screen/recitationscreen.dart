import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../controller/recitationscreen_controller.dart';
import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';
import '../widget/Quran/quranpagecontent.dart';
import '../widget/recitation/floatingbuttonsgroup.dart';
import '../widget/recitation/recitationqurancontent.dart';

class RecitationScreen extends GetView {
  const RecitationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecitationScreenController recitationController =
        Get.put(RecitationScreenController());

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
                controller: PageController(
                    //initialPage: quranController.getPageIndex()
                    ),
                reverse: recitationController.englishLang() ? true : false,
                scrollDirection: Axis.horizontal,
                itemCount: recitationController.getTotalPageCount(),
                itemBuilder: (context, indexP) {
                  return RecitationPageContent(
                      indx: indexP,
                      indexP: indexP + recitationController.getStartPage() - 1);
                })));
  }
}
