import 'package:flutter/Material.dart';

import '../../../core/constant/color.dart';

class VersemarksPart extends StatelessWidget {
  const VersemarksPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 20,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(children: [
            InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        content: SizedBox(
                      height: 50,
                      child: Text("VersMark Details"),
                    ));
                  }),
              // CategoryList[index].onPressed,
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.light2Yellow,
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 7,
                  padding: const EdgeInsets.all(12),
                  child: Text("VersMarks")),
            ),
            const SizedBox(height: 4),
          ]);
        },
      ),
    );
  }
}
