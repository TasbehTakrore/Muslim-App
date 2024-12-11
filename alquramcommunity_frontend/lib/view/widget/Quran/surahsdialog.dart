import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/routes.dart';
import 'listsurahcard.dart';
import '../home/customcardhome.dart';

class SurahsDialog extends StatelessWidget {
  const SurahsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    QuranPageController controller = Get.put(QuranPageController());
    controller.getMistakes();

    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        content: SizedBox(
          width: 600,
          height: controller.anyPageOpend() == false ? 500 : 650,
          child: ListView(
            children: [
              // CustomAppBar(onPressedIcon: () {}),
              controller.anyPageOpend() == true
                  ? CustomCardHome(
                      heigh: 90,
                      title: "أكمل من آخر موضعٍ توقّفت عنده..",
                      body: controller.getLastOpenedEng().value,
                      fontSize1: 13,
                      fontSize2: 18,
                      onTap: () {
                        Get.toNamed(AppRoute.quran);
                      })
                  : const SizedBox(),
              const Text("  سُوَر القرآن الكريم  ",
                  style: TextStyle(fontFamily: "Cairo", fontSize: 15)),
              const SizedBox(height: 6),
              const ListSurahCard(),
            ],
          ),
        ));
  }
}
