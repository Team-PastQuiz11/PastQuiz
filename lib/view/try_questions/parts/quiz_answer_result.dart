import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../try_questions.dart';

class QuizAnswerResult extends ConsumerWidget {
  const QuizAnswerResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionP = ref.watch(questionProvider);
    final quizAnswer = questionP.model.quizAnswer;

    return Center(
      child: quizAnswer != '' ? Text(quizAnswer) : null,
    );
  }
}
