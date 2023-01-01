import 'package:dropdown_sample/dropdown.dart';
import 'package:dropdown_sample/pages/new_file.dart';
import 'package:flutter/material.dart';

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
            children: const <Widget>[
              DropDownPage(),
            ],
          ),
        ));
  }
}
