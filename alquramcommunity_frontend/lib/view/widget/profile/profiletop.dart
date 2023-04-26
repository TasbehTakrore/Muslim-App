import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';


class ProfileTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),

            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                  Container( 
                  decoration: BoxDecoration( 
                      color: Color.fromARGB(125, 110, 169, 145), 
                      borderRadius: BorderRadius.circular(15)), 
                  width: 65, 
                  height: 65, 
                  padding: const EdgeInsets.all(12), 
                  child:  Image.asset("assets/images/planpadge.png",
                  )),
                  SizedBox(width:20),
                   Container( 
                  decoration: BoxDecoration( 
                      color: Color.fromARGB(125, 110, 169, 145), 
                      borderRadius: BorderRadius.circular(15)), 
                  width: 65, 
                  height: 65, 
                  padding: const EdgeInsets.all(12), 
                  child:  Image.asset("assets/images/compadge.png",
                  )), 
            






              ],
            ),
          );
          
  }
}