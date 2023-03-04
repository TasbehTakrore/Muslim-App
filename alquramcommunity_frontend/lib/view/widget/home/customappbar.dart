import 'package:alquramcommunity_frontend/core/constant/imageasset.dart';
import 'package:alquramcommunity_frontend/view/widget/logowidget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  const CustomAppBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedIcon,
      this.onPressedSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(children: [
        const Expanded(flex: 2, child: logoWidget(logowidth: 70, sizeType: 2)),
        Expanded(
            flex: 2,
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                        padding: EdgeInsets.only(top: 5),
                        child:
                            const Text("12", style: TextStyle(fontSize: 18))),
                    const SizedBox(width: 10),
                    Container(
                        margin: EdgeInsets.only(top: 6),
                        child: Image.asset(AppImageAsset.diamond,
                            width: 28, height: 28))
                  ]),
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    const Text("24580", style: TextStyle(fontSize: 13)),
                    const SizedBox(width: 18),
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Image.asset(AppImageAsset.coin,
                            width: 20, height: 20))
                  ])
                ])))
      ]),
    );
  }
}
