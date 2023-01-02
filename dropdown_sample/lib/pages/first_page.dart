import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("サンプルページ")),
        body: Center(
          child: TextButton(
            child: Text("メインページへ"),
            // （1） 前の画面に戻る
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ));
  }
}
