import 'package:alquramcommunity_frontend/core/services/mistake_services.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

import '../../../controller/homescreen_controller.dart';
import '../../../controller/lists_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';

class MistakesPart extends StatelessWidget {
  const MistakesPart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ListsController());

    return GetBuilder<ListsController>(builder: (controller) {
      return FutureBuilder(
          future: controller.getMistakes(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              //print(snapshot.data[0].ayahID);
              return SizedBox(
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height / 1.4,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
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
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //surah name
                                    // Text(
                                    //   "${index + 1}",
                                    //   textAlign: TextAlign.end,
                                    // ),
                                    SizedBox(height: 5),
                                    Text(
                                      getSurahNameArabic(
                                        snapshot.data[index].surahId,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Divider(),
                                    Text(
                                      getVerse(snapshot.data[index].surahId,
                                          snapshot.data[index].ayahId,
                                          verseEndSymbol: true),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 16),
                                    ),

                                    // Text(snapshot.data[index]),
                                  ])),
                          onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    content: SizedBox(
                                      //height: 50,
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            //surah name
                                            Text(
                                              getSurahNameArabic(
                                                snapshot.data[index].surahId,
                                              ),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              getVerse(
                                                  snapshot.data[index].surahId,
                                                  snapshot.data[index].ayahId,
                                                  verseEndSymbol: true),
                                              textAlign: TextAlign.center,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            const SizedBox(height: 20),

                                            ElevatedButton.icon(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.red)),
                                                onPressed: () {
                                                  controller.deleteMistake(
                                                      snapshot
                                                          .data[index].surahId,
                                                      snapshot
                                                          .data[index].ayahId);
                                                  Get.back();
                                                  controller.changeIndex(1);
                                                  // homeScreenController
                                                  //     .changePage(2);
                                                },
                                                icon: const Icon(Icons.delete),
                                                label: const Text(
                                                    "Delete Frome Mistakes"))
                                            // Text(snapshot.data[index]),
                                          ]),
                                    ));
                              }),
                        ),
                        const SizedBox(height: 4),
                      ],
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: CircularProgressIndicator())),
              );
            }
          });
    });
  }
}
