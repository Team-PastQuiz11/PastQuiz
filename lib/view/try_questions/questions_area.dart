import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/view/try_questions/try_questions.dart';

import '../../questions/question.dart';
import 'parts/quiz_answer_result.dart';
import 'parts/quiz_choices.dart';
import 'parts/quiz_divider.dart';
import 'parts/quiz_go_next_button.dart';
import 'parts/quiz_question_info.dart';
import 'parts/quiz_question.dart';

class QuestionArea extends ConsumerStatefulWidget {
  const QuestionArea({super.key});

  @override
  ConsumerState<QuestionArea> createState() => QuestionAreaState();
}

class QuestionAreaState extends ConsumerState<QuestionArea> {
  bool isFirstLoad = false;
  List<Map<String, dynamic>> specificRecord = [];

  @override
  Widget build(BuildContext context) {
    final baseP = ref.watch(baseProvider);
    final questionP = ref.watch(questionProvider);

    final popQuestionStr = baseP.model.popQuestion;
    final popYear = popQuestionStr.substring(0, 4);
    final popIndex = int.parse(popQuestionStr.substring(4));
    final popQuestion = yearMap[popYear]![popIndex];

    const paddingScreen = 16.0;
    const marginAreaBottom = 8.0;
    // for Debug
    const isDebug = false;
    // ignore: dead_code
    const debugColorArea = isDebug ? Colors.white : Colors.transparent;
    // ignore: dead_code
    final debugColorBackground = isDebug ? Colors.grey[100] : Colors.amber[25];

    return FutureBuilder(
      future: (!isFirstLoad && popQuestion.imagePath != '')
          // if-else文の別の書き方
          ? preImageLoad(popQuestion.imagePath)
          : null,
      builder: (context, snapshot) {
        // stream接続の現在の状態を確認しているif文
        // stream待機状態の場合、CircularProgressIndicator()を表示させている
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          body: Container(
            color: debugColorBackground,
            child: Padding(
              padding: const EdgeInsets.all(paddingScreen),
              child: Column(
                children: [
                  const ColoredBox(
                    color: debugColorArea,
                    child: QuizQuestionInfo(),
                  ),
                  const SizedBox(height: marginAreaBottom),
                  const QuizDivider(),
                  const SizedBox(height: marginAreaBottom),
                  Expanded(
                    flex: 1,
                    child: ColoredBox(
                      color: debugColorArea,
                      child: QuizQuestion(popQuestion: popQuestion),
                    ),
                  ),
                  const SizedBox(height: marginAreaBottom),
                  const QuizDivider(),
                  const SizedBox(height: marginAreaBottom),
                  Expanded(
                    flex: 1,
                    child: ColoredBox(
                      color: debugColorArea,
                      child: ListView(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const QuizChoices(),
                          const QuizGoNextButton(),
                          const QuizAnswerResult(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> preImageLoad(String imagePath) async {
    if (imagePath != '') {
      await precacheImage(AssetImage(imagePath), context);
    }
    // widgetが画面に表示されている場合の処理
    if (mounted) {
      setState(() {
        isFirstLoad = true;
      });
    }
  }
  // void getRecordHere(String popQuestion) async{
  //   specificRecord = await UserRecordsModel.getSpecificRecord(popQuestion);
  // }
}
