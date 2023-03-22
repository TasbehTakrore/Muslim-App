import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import 'package:animate_do/animate_do.dart';

import '../../controller/quranscreen_controller.dart';
import '../../core/services/services.dart';
import '../widget/Quran/listsurahcard.dart';
import '../widget/home/customappbar.dart';
import '../widget/home/customcardhome.dart';

class Surahs extends StatelessWidget {
  const Surahs({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuranPageController());
    MyServices myServices = Get.put(MyServices());

    return GetBuilder<QuranPageController>(
        builder: (controller) => Scaffold(
            body: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(children: [
                  CustomAppBar(onPressedIcon: () {}),
                  const CustomCardHome(
                      title: "Continue from the last reading..",
                      body: "Taha - Page 316"),
                  const Text("Surahs of the Qur'an",
                      style: TextStyle(fontFamily: "Cairo")),
                  const SizedBox(height: 6),
                  const ListSurahCard(),
                  //       // InkWell(
                  //       //     highlightColor: Colors.white12,
                  //       //     splashColor: Colors.white12,
                  //       //     onTap: () {
                  //       //       // controller.setRecenlySurah(
                  //       //       //     controller.listOfSurah.toList()[i]);
                  //       //       // Get.to(
                  //       //       //   SurahDetailPage(
                  //       //       //     surah: controller.listOfSurah.toList()[i],
                  //       //       //   ),
                  //       //       //   routeName: 'surah-detail',
                  //       //       // );
                  //       //     },
                  //       //     child: Text("tasbeeeh takrore")
                  //       //     //SurahItem(
                  //       //     //   number: controller.listOfSurah.toList()[i].number,
                  //       //     //   nameShort:
                  //       //     //       controller.listOfSurah.toList()[i].name!.arab,
                  //       //     //   revelation: controller.listOfSurah
                  //       //     //       .toList()[i]
                  //       //     //       .revelation!
                  //       //     //       .id,
                  //       //     //   nameTransliteration:
                  //       //     //       controller.listOfSurah.toList()[i].name!.id,
                  //       //     //   numberOfVerses: controller.listOfSurah
                  //       //     //       .toList()[i]
                  //       //     //       .numberOfVerses,
                  //       //     // ),
                  //       //     ),
                  //       ),
                  // ),

                  // Text(basmala),
                  // Text("${searchWordsInTranslation(["alhamd"])}"),
                  // SvgPicture.asset(AppImageAsset.numbFrame),

                  // SizedBox(
                  //   width: double.infinity,
                  //   height: 600,
                  //   child: PageView.builder(
                  //     reverse:
                  //         myServices.sharedPreferences.getString("lang") == "en"
                  //             ? true
                  //             : false,
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: totalPagesCount,
                  //     itemBuilder: (context, index) {
                  //       return Container(
                  //         color: Colors.red,
                  //         width: 370,
                  //         child: Center(
                  //           child: Text(
                  //             "${getVersesTextByPage(index + 1, verseEndSymbol: true, surahSeperator: SurahSeperator.surahNameEnglish, customSurahSeperator: "\n")}",
                  //             // style: const TextStyle(
                  //             //     fontFamily: "Quran", fontSize: 18),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),

                  // Text(
                  //   "${getVersesTextByPage(590, verseEndSymbol: false, surahSeperator: SurahSeperator.surahNameArabic, customSurahSeperator: "\n")}",
                  //   style: const TextStyle(fontFamily: "Quran", fontSize: 18),
                  // ),

                  // FutureBuilder(
                  //   future: controller.getSurah(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       print(snapshot.data);
                  //       return Text(snapshot.data as String);
                  //     } else
                  //       return Center(child: CircularProgressIndicator());
                  //   },
                  //   //future: ,
                  // )
                ]))));
  }
}
