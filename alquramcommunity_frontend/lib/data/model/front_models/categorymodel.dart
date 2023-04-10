import 'package:flutter/Material.dart';

class CategoryModel {
  final String? title;
  final String? image;
  final void Function()? onPressed;
  final Widget? onPressedWidgetDialog;
  CategoryModel(
      {this.title, this.image, this.onPressedWidgetDialog, this.onPressed});
}
