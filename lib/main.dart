import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main(List<String> args) {
  runApp(const QuestionApp());
}

class _QuestionAppState extends State<QuestionApp> {
  // ignore: unused_local_variable
  var _selectedQuestion = 0;
  // ignore: unused_field
  var _finalscore = 0;

  void _answer(int score) {
    // change the state
    setState(() {
      _selectedQuestion++;
      _finalscore += score;
    });
  }

  void _returnToQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _finalscore = 0;
    });
  }

  final questions = const [
    {
      'text': 'what\'s your favorite food?',
      'answer': [
        {'text': 'x burguer', 'score': 3},
        {'text': 'french fries', 'score': 2},
        {'text': 'fried chicken', 'score': 4},
        {'text': 'milked chocolat', 'score': 1}
      ],
    },
    {
      'text': 'what\'s your favorite animal?',
      'answer': [
        {'text': 'snake', 'score': 4},
        {'text': 'dog', 'score': 2},
        {'text': 'cat', 'score': 1},
        {'text': 'horse', 'score': 3},
      ],
    },
    {
      'text': 'what\'s your favorite actor?',
      'answer': [
        {'text': 'Brad Pitt', 'score': 4},
        {'text': 'Keanu Reeves', 'score': 3},
        {'text': 'Tom Cruise', 'score': 2},
        {'text': 'Chris Evans', 'score': 1},
      ],
    },
    {
      'text': 'what\'s your favorite monkey?',
      'answer': [
        {'text': 'gorilla', 'score': 2},
        {'text': 'mandrill', 'score': 4},
        {'text': 'baboon', 'score': 1},
        {'text': 'marmoset', 'score': 3},
      ],
    },
  ];

  //for (String ans in answers) {
  //  widgets.add(Answer(_answer, ans));
  //}

  bool get isSelected {
    return _selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Simple questions app')),
          backgroundColor: Colors.grey.shade700,
          foregroundColor: Colors.white,
        ),
        body: isSelected
            ? Quiz(
                answer: _answer,
                questions: questions,
                selectedQuestion: _selectedQuestion)
            : Result(
                score: _finalscore,
                whenReturn: _returnToQuiz,
              ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  State<QuestionApp> createState() => _QuestionAppState();
}
