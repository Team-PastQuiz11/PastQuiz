import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../try_questions.dart';

class AnswerResult extends ConsumerWidget {
  const AnswerResult({super.key});

  @override
  Widget build(context, ref) {
    final questionP = ref.watch(questionProvider);
    final quizAnswer = questionP.model.quizAnswer;

    return Center(
      child: quizAnswer != '' ? Text(quizAnswer) : null,
    );
  }
}
