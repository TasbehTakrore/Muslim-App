import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff2C8066), Color(0xff5FCFAE)],
              )),
          alignment: Alignment.center,
          height: 150,
          child: ListTile(
            title: Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 15)),
            subtitle: Text(body,
                style: const TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
      ]),
    );
  }
}
