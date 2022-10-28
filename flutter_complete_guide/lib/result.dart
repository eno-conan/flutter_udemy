import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback resultHandler;
  Result({super.key, required this.resultHandler});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text('ABC'),
        TextButton(onPressed: resultHandler, child: const Text('ABC')),
      ],
    ));
  }
}
