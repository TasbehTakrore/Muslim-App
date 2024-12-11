import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/surahs_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/routes.dart';

// ignore: must_be_immutable
class SurahCard extends GetView<QuranPageController> {
  final String surahName;
  final String surahNumber;
  final String placeOfRevelation;
  final String verseCount;
  final int startPage;

  SurahCard({
    super.key,
    required this.surahName,
    required this.placeOfRevelation,
    required this.surahNumber,
    required this.verseCount,
    required this.startPage,
  });

  @override
  Widget build(BuildContext context) {
    SurahsController surahsController = Get.put(SurahsController());
    return Container(
      decoration: BoxDecoration(
          color: AppColor.light2Yellow,
          borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: SizedBox(
          height: 50,
          width: 50,
          child: Stack(alignment: Alignment.center, children: [
            (int.parse(surahNumber) < 100)
                ? Text(ArabicNumbers().convert(surahNumber),
                    style: const TextStyle(fontSize: 15))
                : Text(ArabicNumbers().convert(surahNumber),
                    style: const TextStyle(fontSize: 12)),
            SvgPicture.asset(
              AppImageAsset.numbFrame,
              width: 40,
            ),
          ]),
        ),
        title: Text(surahName, style: const TextStyle(fontSize: 16)),
        trailing: Text(
            surahsController.suramNumberToSVG[int.parse(surahNumber) - 1],
            style: int.parse(surahNumber) - 1 < 59
                ? const TextStyle(fontFamily: "SurahTitle", fontSize: 50)
                : const TextStyle(fontFamily: "SurahTitle2", fontSize: 50)),
        subtitle: Text(
            "$placeOfRevelation - ${ArabicNumbers().convert(verseCount)} آية",
            style: const TextStyle(fontSize: 10)),
        onTap: () {
          // controller.getMistakes();
          controller.changePageIndexAndSurahName(startPage);
          Get.toNamed(AppRoute.quran);
          //onTap;
        },
      ),
    );
  }
}
