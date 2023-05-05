import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 
 
import '../../../controller/tasbeehscreen_controller.dart';
 
class BeadWidget extends StatelessWidget { 
  final Bead bead; 
 
  const BeadWidget({required this.bead}); 
 
  @override 
  Widget build(BuildContext context) { 
    final rosaryController = Get.find<RosaryController>(); 
 
    return GestureDetector( 
      onTap: () { 
        rosaryController.selectBead(bead.id); 
      }, 
      child: Container( 
        width: 20, 
        height: 20, 
        decoration: BoxDecoration( 
          color: bead.selected ? Colors.green : Colors.white, 
          borderRadius: BorderRadius.circular(10), 
          border: Border.all(color: Colors.green), 
        ), 
      ), 
    ); 
  } 
}