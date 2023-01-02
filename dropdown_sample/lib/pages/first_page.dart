import 'package:dropdown_sample/pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("1stページ")),
        body: Center(
          child: TextButton(
              child: Text("Secondページへ"),
              // （1） 前の画面に戻る
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ));
              }),
        ));
  }
}
