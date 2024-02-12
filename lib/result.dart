import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() whenReturn;

  const Result({required this.whenReturn, required this.score, super.key});

  String get resultPhrase {
    if (score < 8) {
      return 'Congratulations!';
    } else if (score < 10) {
      return 'You are the best!';
    } else if (score < 14) {
      return 'Amazing!';
    } else {
      return 'You\'re in Jedi level';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26),
          ),
        ),
        FloatingActionButton.extended(
          onPressed: whenReturn,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          label: const Text('Try again?'),
          icon: const Icon(Icons.refresh_sharp),
        )
      ],
    );
  }
}
