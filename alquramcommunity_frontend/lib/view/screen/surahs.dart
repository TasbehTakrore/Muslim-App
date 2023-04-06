import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import 'package:animate_do/animate_do.dart';

import '../../controller/quranscreen_controller.dart';
import '../../core/constant/routes.dart';
import '../../core/services/services.dart';
import '../widget/Quran/listsurahcard.dart';
import '../widget/home/customappbar.dart';
import '../widget/home/customcardhome.dart';

class Surahs extends StatelessWidget {
  const Surahs({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuranPageController());

    return GetBuilder<QuranPageController>(
      builder: (controller) {
        final lastOpenedEng = controller.getLastOpenedEng();
        return Container(
          width: 500,
          //height: 900,
          child: ListView(
            children: [
              // CustomAppBar(onPressedIcon: () {}),
              controller.anyPageOpend() == true
                  ? CustomCardHome(
                      heigh: 90,
                      title: "Continue from the last reading..",
                      body: lastOpenedEng.value,
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
        );
      },
    );
  }
}
