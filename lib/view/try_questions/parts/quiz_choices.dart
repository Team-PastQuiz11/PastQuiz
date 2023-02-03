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
    final popYear = popQuestionStr.substring(0, 4);
    final popIndex = int.parse(popQuestionStr.substring(4));
    final popQuestion = yearMap[popYear]![popIndex];

    getRecordHere(popQuestionStr);

    const textAiueo = ['ア', 'イ', 'ウ', 'エ', 'オ'];
    const sizeAiueo = 30.0;
    const colorAiueoBackground = Colors.white;
    const colorChoice = Colors.orange;
    const radiusRect = 15.0;
    const paddingChoiseString =
        EdgeInsets.only(left: 15, top: 2, bottom: 2, right: 2);

    return Column(
      children: [
        for (var i = 0; i < 4; i++) ...[
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // アイウエ部
                Container(
                  width: 50,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: colorChoice,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radiusRect),
                      bottomLeft: Radius.circular(radiusRect),
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: colorAiueoBackground,
                      minimumSize: const Size(sizeAiueo, sizeAiueo),
                    ),
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
                    child: Text(textAiueo[i]),
                  ),
                ),
                // 選択肢文章部
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: paddingChoiseString,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorChoice),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(radiusRect),
                        bottomRight: Radius.circular(radiusRect),
                      ),
                    ),
                    child: Text(
                      popQuestion.choices[i],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
