import 'package:animate_do/animate_do.dart';
import 'package:flutter/Material.dart';

import 'juzcardtrainer.dart';

class JuzContentDialog extends StatelessWidget {
  const JuzContentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Color.fromARGB(255, 181, 20, 20),
        height: MediaQuery.of(context).size.height / 1.75,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return FadeInDown(
                duration: const Duration(milliseconds: 300),
                child: JuzCardTrainer(
                  surahNumber: index + 1,
                ));
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
        ));
  }
}
