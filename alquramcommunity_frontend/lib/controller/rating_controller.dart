import 'package:get/get.dart';

class RatingController extends GetxController {
  final _ratingValue = 0.0.obs;

  double get ratingValue => _ratingValue.value;

  void onRatingUpdate(double value) {
    _ratingValue.value = value;
  }
}