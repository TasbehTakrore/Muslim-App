import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/thikrCatgController.dart';
import '../../data/model/front_models/thikrmodel.dart';

class ThikrDetails extends StatelessWidget {
  const ThikrDetails({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic argumentData = Get.arguments;
    ThikrCatgController thikrCatgController = Get.put(ThikrCatgController());
    //List<Thikr> sections = [];

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: Text("Ayah"),
            onPressed: () {
              print(thikrCatgController
                  .myData.value.thikr![0].tEXT![0].aRABICTEXT);
            }),
      ),

      //     FutureBuilder(
      //   future: thikrCatgController.getAthkar(),
      //   builder: (context, data) {
      //     if (data.hasError) {
      //       return Center(child: Text("${data.error}"));
      //     } else if (data.hasData) {
      //       var section = data.data;
      //       print("===> ${section["Thikr"][0]}");
      //       return ListView.builder(
      //           itemCount: section.length == 0 ? 0 : section.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               elevation: 5,
      //               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //               child: Container(
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     // Container(
      //                     //   width:50,
      //                     //   height:50,
      //                     //   child:
      //                     // //Text(section.),

      //                     // ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           });
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // )
    );
  }
}
