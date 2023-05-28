import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:alquramcommunity_frontend/controller/trainerScreen_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/recitationscreen_controller.dart';
import '../../../controller/surahs_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/routes.dart';

// ignore: must_be_immutable
class JuzCardTrainer extends GetView<TrainerScreenController> {
  final int juzNumber;

  JuzCardTrainer({
    super.key,
    required this.juzNumber,
  });

  @override
  Widget build(BuildContext context) {
    SurahsController surahsController = Get.put(SurahsController());

    return Container(
        decoration: BoxDecoration(
            color: (juzNumber - 2) % 3 != 0
                ? AppColor.lightYellow
                : AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: FadeInDown(
          duration: const Duration(milliseconds: 600),
          child: InkWell(
            child: Container(
              height: 50,
              child: Stack(alignment: Alignment.center, children: [
                Text(ArabicNumbers().convert(juzNumber),
                    style: TextStyle(
                      fontSize: 30,
                      color: (juzNumber - 2) % 3 == 0
                          ? Colors.white
                          : AppColor.black,
                      // fontFamily: "quran",
                    ))
                // SvgPicture.asset(
                //   AppImageAsset.numbFrame,
                //   width: 60,
                // ),
              ]),
            ),
            onTap: () {
              controller.letsJuzTest(juzNumber);
              Get.toNamed(AppRoute.trainer);
              //onTap;
            },
          ),
        ));
  }
}
