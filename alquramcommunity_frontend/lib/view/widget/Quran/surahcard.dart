import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

// ignore: must_be_immutable
class SurahCard extends StatelessWidget {
  final String surahName;
  final String surahNumber;
  final String placeOfRevelation;
  final String verseCount;
  void Function()? onTap;

  SurahCard(
      {super.key,
      required this.surahName,
      required this.placeOfRevelation,
      required this.surahNumber,
      required this.verseCount,
      this.onTap});

  @override
  Widget build(BuildContext context) {
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
                ? Text(surahNumber, style: const TextStyle(fontSize: 15))
                : Text(surahNumber, style: const TextStyle(fontSize: 12)),
            SvgPicture.asset(
              AppImageAsset.numbFrame,
              width: 40,
            ),
          ]),
        ),
        title: Text(surahName),
        trailing: Text(surahNumber,
            style: const TextStyle(fontFamily: "SurahTitle", fontSize: 60)),
        subtitle: Text("$placeOfRevelation - $verseCount Ayah",
            style: const TextStyle(fontSize: 11)),
        onTap: () {
          onTap;
        },
      ),
    );
  }
}
