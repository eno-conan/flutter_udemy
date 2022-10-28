import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // フィールドは基本定数で
  final String questionText;

  //such like constructor
  const Question(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    // SizeBoxというものもあるが、Containerの法が詳しく設定可能
    // https://zenn.dev/ymizushi/articles/ba6399a3a12711
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
