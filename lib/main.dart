// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'questions.dart';
import 'answer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(
      () {
        _questionIndex = _questionIndex + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var question = [
      {
        'questionText': 'what\'i your favorite color ?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'what\'i your favorite animal ?',
        'answers': ['Rabbit', 'Snack', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'what\'i your favorite instructor ?',
        'answers': ['Max', 'Max', 'Max', 'Max'],
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('my first app'),
        ),
        body: Column(
          children: [
            Question(
              question[_questionIndex]['questionText'] as String,
            ),
            ...{question[_questionIndex]['answers'] as List<String>}
                .map((answer) {
              return Answer(_answerQuestion, answer as String);
            }).toList()
          ],
        ),
      ),
    );
  }
}
