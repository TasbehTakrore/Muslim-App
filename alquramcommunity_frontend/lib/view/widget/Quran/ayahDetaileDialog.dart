import 'package:alquramcommunity_frontend/view/widget/Quran/tafser.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../core/constant/color.dart';
import 'topAyahDetaileDialogButton.dart';

class AyahDetailsDialog extends StatelessWidget {
  final int surahNumb;
  final int verseNumb;
  const AyahDetailsDialog(
      {super.key, required this.surahNumb, required this.verseNumb});

  @override
  Widget build(BuildContext context) {
    QuranPageController quranPageController = Get.put(QuranPageController());
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: 300,
        child: ListView(
          //mainAxisSize: MainAxisSize.min,
          children: [
            TopAyahDialogButton(surahNumb: surahNumb, verseNumb: verseNumb),
            const SizedBox(height: 5),
            Text(
              "\uFD3F${getVerse(surahNumb, verseNumb, verseEndSymbol: false)}\uFD3E",
              style: TextStyle(fontFamily: "Quran", fontSize: 18),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            Divider(height: 50),
            quranPageController.englishLang() == true
                ? Text(
                    "${getVerseTranslation(surahNumb, verseNumb, verseEndSymbol: false)}",
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
                                    "${(tafser[0][surahNumb != 1 ? (getVerseCount(surahNumb - 1) + verseNumb).toString() : (verseNumb).toString()] as Map<String, Object>)["verse"]} \n(التّفسير المُيسّر، سورة ${getSurahNameArabic(surahNumb)}، الآية: ${ArabicNumbers().convert(verseNumb)})"));
                            Fluttertoast.showToast(
                              msg: "Text copied to clipboard!",
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
                            style:
                                TextStyle(color: AppColor.black, fontSize: 20),
                          )),
                      Text(
                        "${(tafser[0][surahNumb != 1 ? (getVerseCount(surahNumb - 1) + verseNumb).toString() : (verseNumb).toString()] as Map<String, Object>)["verse"]}",
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
        //
      ),
    );
  }
}
