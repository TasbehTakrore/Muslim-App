import 'package:flutter/Material.dart';

class MyTextWidget extends StatelessWidget {
  final String text;
  final ValueChanged<String>? onTap;

  MyTextWidget({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: ValueKey(text));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(text);
        }
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
