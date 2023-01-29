import 'package:flutter/material.dart';

import '../../../questions/question.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({
    Key? key,
    required this.popQuestion,
  }) : super(key: key);

  final Question popQuestion;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // 問題 本文
        Text(popQuestion.text),
        const SizedBox(height: 8.0),
        // 問題 付図
        if (popQuestion.imagePath != '')
          Column(
            children: [
              Image.asset(
                popQuestion.imagePath,
                width: MediaQuery.of(context).size.width * 0.95,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 8.0),
            ],
          ),
      ],
    );
  }
}
