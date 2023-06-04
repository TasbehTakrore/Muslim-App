import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/recitationscreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/routes.dart';
import 'editquranthemedialog.dart';
import 'goToQuranPageDialog.dart';
import 'searchQuranDialog.dart';

class QuranFloatingButton extends StatelessWidget {
  const QuranFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    RecitationScreenController recitationScreenController =
        Get.put(RecitationScreenController());
    // QuranPageController controller = Get.put(QuranPageController());

    return GetBuilder<QuranPageController>(builder: (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: controller.showFloating,
            child: FloatingActionButton(
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
          ),
          const SizedBox(height: 5),
          Visibility(
            visible: controller.showFloating,
            child: FloatingActionButton(
                heroTag: "goTo",
                backgroundColor: AppColor.thickYellow,
                child: Text("إلى"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext b) {
                        return GoToQuranPageDialog();
                      });
                }),
          ),
          const SizedBox(height: 5),
          Visibility(
            visible: controller.showFloating,
            child: FloatingActionButton(
                heroTag: "Search",
                backgroundColor: AppColor.secondaryColor,
                //hoverColor: AppColor.light2Yellow,
                elevation: 0,
                child: const Icon(
                  Icons.search,
                  size: 30,
                ),
                onPressed: () {
                  recitationScreenController
                      .changePageIndex(controller.getPageIndex() + 1);
                  Get.dialog(SearchQuranDialog());
                }),
          ),
          const SizedBox(height: 5),
          // Visibility(
          //   visible: controller.showFloating,
          //   child: FloatingActionButton(
          //       heroTag: "audio",
          //       backgroundColor: AppColor.secondaryColor,
          //       //hoverColor: AppColor.light2Yellow,
          //       elevation: 0,
          //       child: const Icon(
          //         Icons.multitrack_audio_sharp,
          //         size: 30,
          //       ),
          //       onPressed: () {
          //         controller.playAudioBySurah(1);
          //         // Get.dialog(SearchQuranDialog());
          //       }),
          // ),
          const SizedBox(height: 5),
          Visibility(
            visible: controller.showFloating,
            child: FloatingActionButton(
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
          ),
          const SizedBox(height: 5),
          FloatingActionButton(
              heroTag: "up",
              backgroundColor: Color.fromARGB(106, 44, 121, 80),
              elevation: 0.0,
              child: (controller.showFloating == true)
                  ? const Icon(
                      Icons.arrow_drop_down,
                      size: 40,
                    )
                  : const Icon(
                      Icons.arrow_drop_up,
                      size: 40,
                    ),
              onPressed: () {
                if (controller.showFloating == true) {
                  controller.showFloating = false;
                } else {
                  controller.showFloating = true;
                  print("...${controller.showFloating}");
                }

                controller.updatee();
                print("${controller.showFloating}");
              }),
        ],
      );
    });
  }
}
