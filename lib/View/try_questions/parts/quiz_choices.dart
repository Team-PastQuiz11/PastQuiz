import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/questions/question.dart';
import 'package:past_questions/service/database/user_records_db.dart';

import '../try_questions.dart';

class QuizChoices extends ConsumerStatefulWidget {
  const QuizChoices({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<QuizChoices> createState() => QuizChoicesState();
}

class QuizChoicesState extends ConsumerState<QuizChoices> {
  List<Map<String, dynamic>> specificRecord = [];

  void getRecordHere(String nowQuestion) async {
    specificRecord = await UserRecordsModel.getSpecificRecord(nowQuestion);
    print(specificRecord);
  }

  @override
  Widget build(context) {
    final baseP = ref.watch(baseProvider);
    final questionP = ref.watch(questionProvider);

    final String quizAnswer = questionP.model.quizAnswer;

    final popQuestionStr = baseP.model.popQuestion;
    String popYear = popQuestionStr.substring(0, 4);
    int popIndex = int.parse(popQuestionStr.substring(4));
    final popQuestion = yearMap[popYear]![popIndex];

    getRecordHere(popQuestionStr);

    return Column(
      children: [
        for (var i = 0; i < 4; i++) ...[
          ElevatedButton(
            onPressed: quizAnswer == ''
                ? () {
                    questionP.quizAnswerChange(
                      i == popQuestion.answer ? '正解' : '不正解',
                    );

                    specificRecord.isNotEmpty
                        ? UserRecordsModel.updateRecord(
                            popQuestionStr,
                            i == popQuestion.answer ? 0 : 1,
                          )
                        : UserRecordsModel.createRecord(
                            popQuestionStr: popQuestionStr,
                            isCorrect: i == popQuestion.answer ? 0 : 1,
                          );
                  }
                : null,
            child: Text(popQuestion.choices[i]),
          )
        ],
      ],
    );
  }
}
