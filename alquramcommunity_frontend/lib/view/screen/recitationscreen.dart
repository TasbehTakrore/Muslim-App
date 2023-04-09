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
import '../widget/recitation/recitationqurancontent.dart';

class RecitationScreen extends GetView {
  const RecitationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController localeController = Get.put(LocaleController());
    final RecitationScreenController recitationController =
        Get.put(RecitationScreenController());

    return WillPopScope(
        onWillPop: () async {
          Get.toNamed(AppRoute.home);
          return false;
        },
        child: Scaffold(
            floatingActionButton: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 10.0,
                  right: 120.0,
                  child: FloatingActionButton(
                    heroTag: "next",
                    onPressed: () {
                      recitationController.changeOpacity();
                    },
                    backgroundColor: AppColor.primaryColor,
                    child: Icon(Icons.done),
                  ),
                ),
                Obx(
                  () => Positioned(
                    bottom: 10.0,
                    left: 150.0,
                    child: FloatingActionButton(
                      backgroundColor: recitationController.hintColor.value,
                      onPressed: () {
                        recitationController.showsHint(context);
                      },
                      heroTag: "hint",
                      child: Icon(Icons.lightbulb_outline),
                    ),
                  ),
                )
              ],
            ),
            backgroundColor: AppColor.grey,
            body: ListView(children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  height: 900,
                  child: PageView.builder(
                      onPageChanged: (index) {
                        recitationController.setPageIndex(index);
                        // quranController.changePageIndexAndSurahName(index);
                      },
                      controller: PageController(
                          //initialPage: quranController.getPageIndex()
                          ),
                      reverse: localeController.myServices.sharedPreferences
                                  .getString("lang") ==
                              "en"
                          ? true
                          : false,
                      scrollDirection: Axis.horizontal,
                      itemCount: recitationController.getTotalPageCount(),
                      itemBuilder: (context, indexP) {
                        return RecitationPageContent(
                            indx: indexP,
                            indexP: indexP +
                                recitationController.getStartPage() -
                                1);
                      }))
            ])));
  }
}
