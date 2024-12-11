import 'package:flutter/Material.dart';

class PageSurah extends StatelessWidget {
  const PageSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(direction: Axis.horizontal, children: [
      ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Text("Tasbeh");
        },
      ),
      // List.generate(3, (index) {
      //   return Text("");
      // }),
    ]);
  }
}
