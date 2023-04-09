import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../controller/quranscreen_controller.dart';
import '../../../controller/recitationscreen_controller.dart';

class QuranRecitation extends StatelessWidget {
  final int surahindex;
  final int pageindex;

  const QuranRecitation(
      {Key? key, required this.surahindex, required this.pageindex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    QuranPageController qurancontroller = Get.put(QuranPageController());
    RecitationScreenController recitationController =
        Get.put(RecitationScreenController());

    return Column(
      children: [
        Wrap(
            // page verses and page numb
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            textDirection: TextDirection.rtl,
            spacing: 3,
            children: recitationController.versesList),
        surahindex == getSurahCountByPage(pageindex + 1) - 1
            ? Text(ArabicNumbers().convert(pageindex + 1),
                style: TextStyle(fontSize: 15))
            : SizedBox(),

        // ElevatedButton(
        //   child: const Text('Show Awesome SnackBar'),
        //   onPressed: () {
        //     showTopSnackBar(
        //       padding: const EdgeInsets.all(90),
        //       animationDuration: Duration(milliseconds: 1000),
        //       displayDuration: Duration(microseconds: 100),
        //       Overlay.of(context),
        //       const CustomSnackBar.info(
        //         backgroundColor: AppColor.lightYellow,
        //         icon: Icon(Icons.light_mode_outlined),
        //         message:
        //             'There is some information. You need to do something with that',
        //       ),
        //     );
        //   },
        // ),

        // InkWell(
        //   onTap: () {
        //     // Show a momentary note or feedback
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //         content: Text('Button pressed!'),
        //         duration: Duration(seconds: 1),
        //       ),
        //     );
        //   },
        //   child: Container(
        //     padding: EdgeInsets.all(16),
        //     decoration: BoxDecoration(
        //       color: Colors.blue,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Text(
        //       'Press me',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 18,
        //       ),
        //     ),
        //   ),
        // )
        // Tooltip(
        //   message: "Click me! ggggggggggggg",
        //   child: IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: () {
        //       // Perform button action
        //     },
        //   ),
        // )
        // Text(
        //   "How are you today?",
        //   style: TextStyle(
        //       fontSize: 40,
        //       fontWeight: FontWeight.w900,
        //       foreground: Paint()
        //         ..shader = LinearGradient(
        //           colors: <Color>[
        //             Colors.black,
        //             AppColor.grey,
        //             // AppColor.grey,
        //             // AppColor.grey,
        //             // AppColor.grey,
        //           ],
        //         ).createShader(Rect.fromLTWH(100, 0, 200, 0))),
        // ),
        // TweenAnimationBuilder(
        //   tween: Tween<double>(begin: 0.0, end: 1.0),
        //   duration: Duration(seconds: 1),
        //   builder: (BuildContext context, double value, Widget? child) {
        //     _opacity = value;
        //     return Opacity(
        //       opacity: _opacity,
        //       child: Text(
        //         'Hello, world!',
        //         style: TextStyle(
        //           fontSize: 24,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.blue,
        //         ),
        //       ),
        //     );
        //   },
        // )
      ],
    );
  }
}
