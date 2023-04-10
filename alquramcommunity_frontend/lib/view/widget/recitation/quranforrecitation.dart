import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../controller/recitationscreen_controller.dart';

class QuranRecitation extends StatelessWidget {
  final int surahindex;
  final int pageindex;

  const QuranRecitation(
      {Key? key, required this.surahindex, required this.pageindex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    QuranPageController qurancontroller = Get.put(QuranPageController());
    RecitationScreenController recitationController =
        Get.put(RecitationScreenController());

    return Column(
      children: [
        Wrap(
            // page verses and page numb
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            textDirection: TextDirection.rtl,
            spacing: 3,
            children: recitationController.versesList),
        surahindex == getSurahCountByPage(pageindex + 1) - 1
            ? Text(ArabicNumbers().convert(pageindex + 1),
                style: TextStyle(fontSize: 15))
            : SizedBox(),
      ],
    );
  }
}
