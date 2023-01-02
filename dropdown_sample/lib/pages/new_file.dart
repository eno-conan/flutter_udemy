import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String message;

  MyText({Key? key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 24,
          ),
        ));
  }
}
