import 'package:alquramcommunity_frontend/controller/quranscreen_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/recitationscreen_controller.dart';
import '../../../controller/surahs_controller.dart';
import '../../../controller/trainerScreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/routes.dart';

// ignore: must_be_immutable
class PageCardTrainer extends GetView<TrainerScreenController> {
  final int pageNumb;

  PageCardTrainer({
    super.key,
    required this.pageNumb,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(TrainerScreenController());
    SurahsController surahsController = Get.put(SurahsController());

    return Container(
      decoration: BoxDecoration(
          color: (pageNumb - 2) % 3 != 0
              ? AppColor.lightYellow
              : AppColor.light2Yellow,
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        child: Container(
          height: 50,
          child: Stack(alignment: Alignment.center, children: [
            Text(ArabicNumbers().convert(pageNumb),
                style: TextStyle(
                  fontSize: 18,
                  color: (pageNumb - 2) % 3 == 0
                      ? Colors.black
                      : AppColor.primaryColor,
                  // fontFamily: "quran",
                  //fontFamily: "PlayfairDisplay",
                ))
            // SvgPicture.asset(
            //   AppImageAsset.numbFrame,
            //   width: 60,
            // ),
          ]),
        ),
        onTap: () async{
         await controller.letsPageTest(pageNumb);

          print(pageNumb);
          //Get.toNamed(AppRoute.recitation);
          //onTap;
        },
      ),
    );
  }
}
