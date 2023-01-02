import 'package:dropdown_sample/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("1stページ")),
        body: Center(
          child: Column(
            children: <Widget>[
              // 別ページへ遷移するボタン
              TextButton(
                  child: Text("2ndページへ"),
                  // （1） 前の画面に戻る
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(),
                        ));
                  }),
              const Spacer(),
              // スライドアップ
              SlidingUpPanel(
                body: const Center(
                  child: Text('Hello World!'),
                ),
                panel: const Center(
                  child: Text('こんにちは世界！'),
                ),
                collapsed: const Center(
                  child: Text('テスト'),
                ),
              ),
            ],
          ),
        ));
  }
}
