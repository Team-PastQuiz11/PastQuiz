import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../questions/question.dart';
import '../../../service/database/user_records_db.dart';
import '../try_questions.dart';

class QuizChoices extends ConsumerStatefulWidget {
  const QuizChoices({super.key});

  @override
  ConsumerState<QuizChoices> createState() => QuizChoicesState();
}

class QuizChoicesState extends ConsumerState<QuizChoices> {
  List<Map<String, dynamic>> specificRecord = [];

  Future<void> getRecordHere(String nowQuestion) async {
    specificRecord = await UserRecordsModel.getSpecificRecord(nowQuestion);
  }

  @override
  Widget build(BuildContext context) {
    final baseP = ref.watch(baseProvider);
    final questionP = ref.watch(questionProvider);

    final quizAnswer = questionP.model.quizAnswer;

    final popQuestionStr = baseP.model.popQuestion;
    var popYear = popQuestionStr.substring(0, 4);
    var popIndex = int.parse(popQuestionStr.substring(4));
    final popQuestion = yearMap[popYear]![popIndex];

    getRecordHere(popQuestionStr);

    return Column(
      children: [
        for (var i = 0; i < 4; i++) ...[
          Container(
            // 横幅指定　左右に16px、上下に0.5pxの隙間を開ける
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0.5),
            width: 500,
            // 選択肢ボタンを横の揃える
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: quizAnswer == ''
                  ? () {
                      // 回答選択肢が問題の正解だった場合'正解'、そうでない場合'不正解'を返す三項演算子
                      questionP.quizAnswerChange(
                        i == popQuestion.answer ? '正解' : '不正解',
                      );

                      // 成績の有無によってDBに成績を作成するか、既存の成績を更新するかの三項演算子
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
                  // quizAnswerが空ではなかった場合の処理は無い
                  // ここもう少しスマートに書けたりしないかな？
                  : null,
              child: Container(
                // ボタンの文字を左寄りに
                alignment: Alignment.centerLeft,
                child: Text(
                  popQuestion.choices[i],
                ),
              ),
            ),
          )
        ],
      ],
    );
  }
}
