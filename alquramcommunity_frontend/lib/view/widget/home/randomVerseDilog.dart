import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';

import '../../../controller/randomVerse_controller.dart';
import '../../../core/constant/color.dart';
import '../Quran/tafser.dart';

class RandomVerseDilog extends StatelessWidget {
  const RandomVerseDilog({super.key});

  @override
  Widget build(BuildContext context) {
    RandomVerseController randomVerseController =
        Get.put(RandomVerseController());
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        content: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: 300,
          child: ListView(
            //mainAxisSize: MainAxisSize.min,
            children: [
              // TopAyahDialogButton(surahNumb: surahNumb, verseNumb: verseNumb),
              const SizedBox(height: 20),
              Text(
                randomVerseController.todeyVerse,
                style: const TextStyle(
                    fontFamily: "Quran",
                    fontSize: 18,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w600),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
              Divider(height: 50),
              randomVerseController.englishLang() == true
                  ? Text(
                      randomVerseController.todayVerseTafseerEng,
                      style: TextStyle(fontFamily: "Quran", fontSize: 18),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton.icon(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                      randomVerseController.todayVerseTafseer));
                              Fluttertoast.showToast(
                                msg: "تمّ النسخ إلى الحافظة!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                              );
                            },
                            icon: const Icon(
                              Icons.copy,
                              color: AppColor.secondaryColor,
                              size: 25,
                            ),
                            label: const Text(
                              "(التّفسير المُيسّر)",
                              style: TextStyle(
                                  color: AppColor.black, fontSize: 20),
                            )),
                        Text(
                          randomVerseController.todayVerseTafseer,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
            ],
          ),
        )
        //Text(randomVerseController.todayVerseTafseer),
        );
  }
}
