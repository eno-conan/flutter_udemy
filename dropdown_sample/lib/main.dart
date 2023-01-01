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
class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  //2:itemsのいずれかに設定しないとエラー出る
  String? isSelectedItem = 'bbb';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropdownButton Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //3
            DropdownButton(
              //4
              items: const [
                //5
                DropdownMenuItem(
                  child: Text('aaa'),
                  value: 'aaa',
                ),
                DropdownMenuItem(
                  child: Text('bbb'),
                  value: 'bbb',
                ),
                DropdownMenuItem(
                  child: Text('ccc'),
                  value: 'ccc',
                ),
              ],
              //6
              onChanged: (String? value) {
                setState(() {
                  isSelectedItem = value;
                });
              },
              //7:
              value: isSelectedItem,
            ),
            const SizedBox(
              height: 32,
            ),
            Text('$isSelectedItem が選択されました。'),
            // ある文字列を渡して、その文言を表示するWidgetを読み込み
            MyText(
              message: 'Hello2',
            )
          ],
        ),
      ),
    );
  }
}
