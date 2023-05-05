import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';

class MyController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  Rx<Color> prim = AppColor.primaryColor.obs;
  Rx<Color> Second = AppColor.secondaryColor.obs;
  Color? swap;
  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0, 0), end: const Offset(0.5, 0.3)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0.5, 0.3), end: const Offset(1, 0.6)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: const Offset(1, 0.6), end: const Offset(1.3, 0.9)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween:
            Tween(begin: const Offset(1.3, 0.9), end: const Offset(1.6, 1.2)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween:
            Tween(begin: const Offset(1.6, 1.2), end: const Offset(1.9, 1.6)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween:
            Tween(begin: const Offset(1.9, 1.6), end: const Offset(2.4, 1.7)),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        swap = prim.value;
        prim.value = Second.value;
        Second.value = swap!;
      }
    });
  }

  void onTap() {
    _controller.forward();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}

class MyApp extends StatelessWidget {
  final MyController _myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppColor.grey,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: AppColor.grey,
            height: MediaQuery.of(context).size.height * 2 / 3.3,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.grey,
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              // mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Positioned(
                  top: -75,
                  left: -MediaQuery.of(context).size.width / 2.4,
                  child: Container(
                    width: 490,
                    height: 490,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.08,
                        image: AssetImage('assets/images/tasbehBorder.png'),
                        fit: BoxFit.contain,
                      ),
                      color: AppColor.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 63,
                  bottom: 0,
                  left: -MediaQuery.of(context).size.width / 1.5,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        width: 3,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 76.8,
                  child: Container(
                    //color: AppColor.grey,
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: _myController.onTap,
                      child: AnimatedBuilder(
                        animation: _myController._animation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: _myController._animation.value * 30,
                            child: Opacity(
                              opacity: _myController._controller.status ==
                                      AnimationStatus.completed
                                  ? 0
                                  : 1,
                              child: child,
                            ),
                          );
                        },
                        child: Obx(
                          () => Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                opacity: 0.3,
                                image: AssetImage('assets/images/Beam.jpg'),
                                fit: BoxFit.fill,
                              ),
                              color: _myController.prim.value,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 22,
                  child: Obx(
                    () => Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.3,
                          image: AssetImage('assets/images/Beam.jpg'),
                          fit: BoxFit.fill,
                        ),
                        color: _myController.Second.value,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  child: Obx(
                    () => Container(
                      width: 25,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.3,
                          image: AssetImage('assets/images/halfBeam.jpg'),
                          fit: BoxFit.fill,
                        ),
                        color: _myController.prim.value,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3 - 35,
                  left: MediaQuery.of(context).size.width / 2 - 100,
                  child: Obx(
                    () => Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.3,
                          image: AssetImage('assets/images/halfBeam.jpg'),
                          fit: BoxFit.fill,
                        ),
                        color: _myController.Second.value,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3 - 133.8,
                  left: MediaQuery.of(context).size.width / 2 - 55,
                  child: Obx(
                    () => Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.3,
                          image: AssetImage('assets/images/Beam.jpg'),
                          fit: BoxFit.fill,
                        ),
                        color: _myController.Second.value,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3 - 75,
                  left: MediaQuery.of(context).size.width / 2 - 64.8,
                  child: Obx(
                    () => Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.3,
                          image: AssetImage('assets/images/Beam.jpg'),
                          fit: BoxFit.fill,
                        ),
                        color: _myController.prim.value,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
