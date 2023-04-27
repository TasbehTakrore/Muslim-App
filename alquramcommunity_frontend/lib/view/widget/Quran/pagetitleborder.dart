import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../controller/quranscreen_controller.dart';

class PageTitleBorder extends StatelessWidget {
  PageTitleBorder({super.key});
  final QuranPageController quranController = Get.put(QuranPageController());

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.rtl,
        children: [
          Text("${quranController.surahName}"),
          Text(
              "الجزء ${ArabicNumbers().convert(quranController.pageJuzNumber)}"),
        ]);
  }
}
