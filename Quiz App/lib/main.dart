import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': "What's your Fav. color?",
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'blue', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 1}
      ],
    },
    {
      'questionText': "What's your Fav. Animal?",
      'answers': [
        {'text': 'ant', 'score': 10},
        {'text': 'black cobra', 'score': 20},
        {'text': 'black panther', 'score': 30},
        {'text': 'rabbit', 'score': 40}
      ],
    },
    {
      'questionText': "What's your Fav. Instructor?",
      'answers': [
        {'text': 'A', 'score': 1},
        {'text': 'B', 'score': 2},
        {'text': 'C', 'score': 3},
        {'text': 'D', 'score': 4}
      ],
    }
  ];
  var _indx = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _indx = 0;
      _totalScore = 0;
    });
  }

  void _onclick(int score) {
    _totalScore += score;
    setState(() {
      _indx = _indx + 1;
    });
    print(_indx);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _indx < questions.length
            ? Column(
                children: <Widget>[
                  Questions(
                    questions[_indx]['questionText'],
                  ),
                  ...(questions[_indx]['answers'] as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(
                      () => _onclick(answer['score']),
                      answer['text'],
                    );
                  }).toList()
                ],
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
