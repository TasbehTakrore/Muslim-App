import 'package:flutter/Material.dart';

class CategoryModel {
  final String? title;
  final String? image;
  final Widget? onPressedWidget;
  final void Function()? press;
  CategoryModel({this.title, this.image, this.onPressedWidget, this.press});
}
