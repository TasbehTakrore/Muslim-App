import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:quran/quran.dart';
import '../../../core/constant/color.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TopAyahDialogButton extends StatelessWidget {
  final int surahNumb;
  final int verseNumb;
  const TopAyahDialogButton(
      {super.key, required this.surahNumb, required this.verseNumb});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(
                  text:
                      "\uFD3F${getVerse(surahNumb, verseNumb)}\uFD3E  [${getSurahNameArabic(surahNumb)}: ${ArabicNumbers().convert(verseNumb)}]"));
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
              size: 30,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
              color: AppColor.secondaryColor,
              size: 30,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: AppColor.secondaryColor,
              size: 30,
            )),
      ],
    );
  }
}
