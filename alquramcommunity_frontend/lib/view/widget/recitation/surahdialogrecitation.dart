import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:alquramcommunity_frontend/view/widget/Quran/quranpagecontent.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import '../../../controller/recitationscreen_controller.dart';
import '../../../core/constant/quranconst.dart';
import 'listsurahcardrecitation.dart';

class SurahsDialogRecitation extends StatelessWidget {
  const SurahsDialogRecitation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RecitationScreenController());
    QuranPageController quranPageContent = Get.put(QuranPageController());
    quranPageContent.goToDefult();
    return GetBuilder<RecitationScreenController>(
      builder: (controller) {
        // final lastOpenedEng = controller.getLastOpenedEng();
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: SizedBox(
              width: 600,
              height: 550,
              child: ListView(
                children: const [
                  Text("سوَر القُرآن الكريم",
                      style: TextStyle(fontFamily: "Cairo")),
                  SizedBox(height: 6),
                  ListSurahCardRecitation(),
                ],
              ),
            ));
      },
    );
  }
}
