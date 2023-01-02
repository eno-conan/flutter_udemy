import 'package:dropdown_sample/dropdown.dart';
import 'package:dropdown_sample/pages/first_page.dart';
import 'package:dropdown_sample/pages/new_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SamplePage(),
    );
  }
}

//1
class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  //2:itemsのいずれかに設定しないとエラー出る
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DropdownButton Sample'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MyText(message: 'Hello'),
              const DropDownPage(),
              const Divider(
                height: 50,
              ),
              Icon(Icons.share),
              SizedBox(
                height: 16,
              ),
              Icon(CupertinoIcons.share),
              TextButton(
                child: Text("サンプルページへ"),
                onPressed: () {
                  // （1） 指定した画面に遷移する
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // （2） 実際に表示するページ(ウィジェット)を指定する
                          builder: (context) => FirstPage()));
                },
              ),
              const Spacer(),
              DottedBorder(
                color: Colors.blue,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
              const Spacer(),
            ],
          ),
        ));
  }
}
