import 'package:get/get.dart';
import 'package:alquramcommunity_frontend/view/widget/Tasbeeh/Bead.dart';

class RosaryController extends GetxController {
  var beads = <Bead>[].obs;
  var activeBeadIndex = 0.obs;
  var rightBeads = <Bead>[].obs;
  var leftBeads = <Bead>[].obs;

  @override
  void onInit() {
    super.onInit();
    for (var i = 1; i <= 33; i++) {
      beads.add(Bead(id: i, offset: i * 20.0));
    }

    // Split the beads into rightBeads and leftBeads
    final middleIndex = (beads.length / 2).ceil();
    rightBeads.assignAll(beads.sublist(middleIndex));
    leftBeads.assignAll(beads.sublist(0, middleIndex).reversed.toList());
  }

  void selectBead(int id) {
    final index = id - 1;
    beads[index].selected = !beads[index].selected;
    update();
  }

  void setActiveBead(int index) {
    activeBeadIndex.value = index;
    update();
  }

  void moveBeadsRight() {
    for (int i = 0; i < 32; i++) {
      if (beads[i].selected) {
        beads[i + 1].selected = true;
        beads[i].selected = false;
      }
    }
    if (beads.last.selected) {
      beads.first.selected = true;
      beads.last.selected = false;
    }
    update();
  }

  void moveBeadsLeft() {
    for (int i = 31; i >= 0; i--) {
      if (beads[i].selected) {
        beads[i - 1].selected = true;
        beads[i].selected = false;
      }
    }
    if (beads.first.selected) {
      beads.last.selected = true;
      beads.first.selected = false;
    }
    update();
  }

  void rotateBeads(bool isClockwise) {
    if (isClockwise) {
      final last = rightBeads.removeLast();
      rightBeads.insert(0, last);
      final first = leftBeads.removeAt(0);
      leftBeads.add(first);
    } else {
      final first = rightBeads.removeAt(0);
      rightBeads.add(first);
      final last = leftBeads.removeLast();
      leftBeads.insert(0, last);
    }
    update();
  }
}

class Bead {
  int id;
  bool selected;
  double offset;

  Bead({required this.id, this.selected = false, required this.offset});
}
