import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/model/base_model.dart';
import 'package:past_questions/service/database/study_state_db.dart';

import '../try_questions.dart';

class GoNextButton extends ConsumerWidget {
  const GoNextButton({super.key});

  @override
  Widget build(context, ref) {
    final baseP = ref.watch(baseProvider);
    final questionP = ref.watch(questionProvider);
    final quizAnswer = questionP.model.quizAnswer;

    if (quizAnswer == '') {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      width: 500,
      child: ElevatedButton(
        // 試験的に'次へ'ボタンを丸くしてみた ------->
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        // ------------------------------------->
        onPressed: () async {
          questionP.quizAnswerChange('');

          if (unsolvedQuestions.isNotEmpty) {
            List<Map<String, dynamic>> state = await StudyStateModel.getState();
            baseP.goNextQ(stateId: state[0]['id']);
          } else {
            baseP.goEnd();
          }
        },
        child: const Text('次へ'),
      ),
    );
  }
}
