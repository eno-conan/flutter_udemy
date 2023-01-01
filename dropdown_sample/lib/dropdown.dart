import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  const DropDownPage({Key? key}) : super(key: key);

  @override
  State<DropDownPage> createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  //2:itemsのいずれかに設定しないとエラー出る
  String? isSelectedItem = 'bbb';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
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
    );
  }
}
