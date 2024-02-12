import 'package:flutter/material.dart';

//constructors as class
import './question.dart';
import './answer.dart';

//this class is the most complex yet
class Quiz extends StatelessWidget {
  final void Function(int) answer;
  final List<Map<String, Object>> questions;
  final int selectedQuestion;

  const Quiz(
      {required this.answer,
      required this.questions,
      required this.selectedQuestion,
      super.key});

  bool get isSelected {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = isSelected
        ? questions[selectedQuestion]['answer'] as List<Map<String, Object>>
        : [];
    return Column(
      children: [
        Question(questions[selectedQuestion]['text'] as String),
        ...answers
            .map((ans) => Answer(
                () => answer(ans['score'] as int), ans['text'] as String))
            .toList(), //spread, functional languages
      ],
    );
  }
}
