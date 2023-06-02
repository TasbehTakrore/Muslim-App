import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/routes.dart';

class SearchQuranDialog extends StatelessWidget {
  const SearchQuranDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // QuranPageController controller = Get.put(QuranPageController());

    return GetBuilder<QuranPageController>(builder: (controller) {
      return Dialog.fullscreen(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 600,
            child: ListView(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImageAsset.mosqueLine,
                  fit: BoxFit.contain,
                  height: 50,
                ),
                TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    iconColor: AppColor.secondaryColor,
                    prefixIconColor: AppColor.secondaryColor,
                    hintText: 'ابحث عن كلمةٍ مُحدّدة',
                    prefixIcon: Icon(Icons.search),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.secondaryColor,
                      ),
                    ),
                  ),
                  cursorColor: AppColor.secondaryColor,
                  onChanged: (value) {
                    if (value == "")
                      controller.verseSearch = {'result': []};
                    else
                      controller.verseSearch = searchWords([value]);
                    print("controller.verseSearch: ${controller.verseSearch}");
                    controller
                        .updatee(); // Perform search based on the entered value
                    // Update the search results in the dialog
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "   ${ArabicNumbers().convert(controller.verseSearch['result'].length)} من النّتائج"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: ListView.builder(
                    itemCount: controller.verseSearch['result'].length,
                    itemBuilder: (context, index) {
                      // print(
                      //     "controller.verseSearch[index].toString(): ${controller.verseSearch[index].toString()} ++ $index");
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            // CategoryList[index].onPressed,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.lightYellow,
                                    borderRadius: BorderRadius.circular(15)),
                                width: MediaQuery.of(context).size.width,
                                // height: MediaQuery.of(context).size.height / 7,
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 5),
                                      Text(
                                        getSurahNameArabic(
                                          controller.verseSearch['result']
                                              [index]['surah'],
                                        ),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Divider(),
                                      Text(
                                        getVerse(
                                            controller.verseSearch['result']
                                                [index]['surah'],
                                            controller.verseSearch['result']
                                                [index]['verse'],
                                            verseEndSymbol: true),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 16),
                                      ),

                                      // Text(snapshot.data[index]),
                                    ])),
                            onTap: () {
                              Get.back();
                              controller.pageController!.animateToPage(
                                getPageNumber(
                                        controller.verseSearch['result'][index]
                                            ['surah'],
                                        controller.verseSearch['result'][index]
                                            ['verse']) -
                                    1,
                                duration: const Duration(
                                    milliseconds: 1), // المدة المطلوبة للانتقال
                                curve: Curves.ease, // منحنى التحول
                              );
                            },
                          ),
                          const SizedBox(height: 4),
                        ],
                      );

                      // Text("${controller.verseSearch['result'][index]}");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
