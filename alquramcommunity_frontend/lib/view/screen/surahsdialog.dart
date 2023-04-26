import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../controller/quranscreen_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/Quran/listsurahcard.dart';
import '../widget/home/customcardhome.dart';

class SurahsDialog extends StatelessWidget {
  const SurahsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuranPageController());

    return GetBuilder<QuranPageController>(
      builder: (controller) {
        // final lastOpenedEng = controller.getLastOpenedEng();
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: SizedBox(
              width: 600,
              height: 650,
              child: ListView(
                children: [
                  // CustomAppBar(onPressedIcon: () {}),
                  controller.anyPageOpend() == true
                      ? CustomCardHome(
                          heigh: 90,
                          title: "Continue from the last reading..",
                          body: controller.getLastOpenedEng().value,
                          fontSize1: 13,
                          fontSize2: 18,
                          onTap: () {
                            Get.toNamed(AppRoute.quran);
                          })
                      : const SizedBox(),
                  const Text("Surahs of the Qur'an",
                      style: TextStyle(fontFamily: "Cairo")),
                  const SizedBox(height: 6),
                  const ListSurahCard(),
                ],
              ),
            ));
      },
    );
  }
}
