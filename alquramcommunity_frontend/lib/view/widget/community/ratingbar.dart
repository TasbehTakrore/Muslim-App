import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../controller/rating_controller.dart';

class RatingBars extends StatelessWidget {
  final double initialRating;
  final Function(double)? onRatingUpdate;

  RatingBars({
    required this.initialRating,
    required this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    RatingController ratingController=Get.put(RatingController());
    return RatingBar.builder(
      initialRating: initialRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      onRatingUpdate:onRatingUpdate ?? (rating) {},
    );
  }
}
