import 'package:alquramcommunity_frontend/core/constant/color.dart';
import 'package:flutter/Material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'communitywidget.dart';
import 'joincommunity.dart';

class ListCommunities extends StatelessWidget {
  const ListCommunities({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 205,
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 2),
            itemCount: 2, ////
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index < 1) {
                return const Community();
              } else {
                return const JoinCommunity();
              }
            }));
  }
}
