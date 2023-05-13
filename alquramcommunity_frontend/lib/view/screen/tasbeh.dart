import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../controller/tasbeehscreen_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/Tasbeeh/addnewtasbeeh.dart';
import '../widget/Tasbeeh/customdropdown.dart';

class TasbeehPage extends StatelessWidget {
  final TasbeehController _myController = Get.put(TasbeehController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return GetBuilder<TasbeehController>(builder: (controller) {
      return WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(AppRoute.home);

            return false;
          },
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                color: AppColor.grey,

                image: DecorationImage(
                    opacity: 0.08,
                    image: AssetImage('assets/images/tasbehBorderRight.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.topRight),
                //color: Colors.red,
              ),
              // color: Colors.red,
              height: MediaQuery.of(context).size.height,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(

                      // color: AppColor.grey,
                      height: MediaQuery.of(context).size.height * 2 / 2.92,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  _myController.prim.value =
                                      Color.fromARGB(255, 222, 178, 46);
                                  _myController.Second.value =
                                      Color.fromARGB(255, 239, 207, 112);
                                },
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      opacity: 0.3,
                                      image:
                                          AssetImage('assets/images/Beam.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Color.fromARGB(255, 222, 178, 46),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              InkWell(
                                onTap: () {
                                  _myController.prim.value =
                                      Color.fromARGB(255, 224, 108, 147);
                                  _myController.Second.value =
                                      Color.fromARGB(255, 235, 152, 180);
                                },
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      opacity: 0.3,
                                      image:
                                          AssetImage('assets/images/Beam.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Color.fromARGB(255, 224, 108, 147),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              InkWell(
                                onTap: () {
                                  _myController.prim.value =
                                      Color.fromARGB(255, 168, 86, 182);
                                  _myController.Second.value =
                                      Color.fromARGB(255, 234, 189, 240);
                                },
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      opacity: 0.3,
                                      image:
                                          AssetImage('assets/images/Beam.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Color.fromARGB(255, 168, 86, 182),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              InkWell(
                                onTap: () {
                                  _myController.prim.value =
                                      AppColor.primaryColor;
                                  _myController.Second.value =
                                      AppColor.secondaryColor;
                                },
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      opacity: 0.3,
                                      image:
                                          AssetImage('assets/images/Beam.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                    color: AppColor.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            // color: Colors.red,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext b) {
                                                return AddNewTasbeeh();
                                              });
                                        },
                                        child: const Icon(
                                          Icons.add_box,
                                          size: 60,
                                          color: AppColor.primaryColor,
                                          weight: 100,
                                        ),
                                      ),
                                      SizedBox(
                                        //padding: EdgeInsets.only(top: 60),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: CustomDropdown(
                                          onChanged: (selectedItem) {
                                            _myController
                                                .changeIteamIndex(selectedItem);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColor.grey,
                    height: MediaQuery.of(context).size.height / 3.2,
                    child: Stack(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Positioned(
                          top: -75,
                          left: -MediaQuery.of(context).size.width / 2.2,
                          child: Container(
                            width: 490,
                            height: 490,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                opacity: 0.08,
                                image: AssetImage(
                                    'assets/images/tasbehBorder.png'),
                                fit: BoxFit.contain,
                              ),
                              color: AppColor.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 68,
                          bottom: -50,
                          left: -MediaQuery.of(context).size.width / 1.4,
                          right: 20,
                          child: Container(
                            height: MediaQuery.of(context).size.width * 2.6,
                            width: MediaQuery.of(context).size.width * 2.6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.5),
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 48,
                          left: 76.8,
                          child: Container(
                            //color: AppColor.grey,
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onLongPressStart: (long) {
                                _myController.onTap;
                              },
                              onLongPressDown: (long) {
                                _myController.onTap;
                              },
                              onTap: _myController.onTap,
                              child: AnimatedBuilder(
                                animation: _myController.animation,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: _myController.animation.value * 30,
                                    child: Opacity(
                                      opacity:
                                          _myController.controller.status ==
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
                                        image: AssetImage(
                                            'assets/images/Beam.jpg'),
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
                            top: 220,
                            right: 22,
                            child: Text(
                              _myController.gettasbeehtype(),
                              style: const TextStyle(
                                  color: AppColor.black, fontSize: 20),
                            )),
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
                                  image:
                                      AssetImage('assets/images/halfBeam.jpg'),
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
                          top: MediaQuery.of(context).size.height / 3 - 28,
                          left: MediaQuery.of(context).size.width / 2 - 92.5,
                          child: Obx(
                            () => Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  opacity: 0.3,
                                  image:
                                      AssetImage('assets/images/halfBeam.jpg'),
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
                          top: MediaQuery.of(context).size.height / 3 - 134.8,
                          left: MediaQuery.of(context).size.width / 2 - 65,
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
                          left: MediaQuery.of(context).size.width / 2 - 66.8,
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
                        Positioned(
                          top: 55,
                          left: 0,
                          child: InkWell(
                            onTap: () {
                              _myController.changeValue();
                              _myController.onTap();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              //color: Colors.red,
                              height: 180,
                              width: 190,
                              child: Text(
                                _myController.getValue().toString(),
                                style: const TextStyle(
                                    color: AppColor.black, fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
