import 'package:flutter/material.dart';

import 'quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color',
      'answer': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answer': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
  ];
  var _questionIndex = 0;
  void _answerQuestion() {
    // 変数の状態保持
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('can answer more');
    }
  }

  void _resultHandler() {
    _questionIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    // var _questions = [
    //   'What\'s your favorite color',
    //   'What\'s your favorite animal'
    // ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Hello World')),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionsIndex: _questionIndex,
              questions: _questions,
            )
          : Result(resultHandler: _resultHandler),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            activeIcon: Icon(Icons.book_online),
            label: 'Book',
            tooltip: "This is a Book Page",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            activeIcon: Icon(Icons.business_center),
            label: 'Business',
            tooltip: "This is a Business Page",
            backgroundColor: Colors.green,
          ),
        ],
      ),
    ));
  }
}
