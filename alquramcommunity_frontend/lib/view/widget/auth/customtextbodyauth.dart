import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String text; 
  const CustomTextBodyAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
               text,
               textAlign: TextAlign.center,
               style: Theme.of(context).textTheme.headlineSmall,
               ),
            );

  }
}