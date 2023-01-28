import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/view/try_questions/try_questions.dart';

import '../../questions/question.dart';
import 'parts/answer_result.dart';
import 'parts/go_next_button.dart';
import 'parts/quiz_choices.dart';

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

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                // 問題 領域 (最大:画面上部50%)
                ConstrainedBox(
                  constraints:
                      BoxConstraints.loose(Size(screenWidth, screenHeight / 2)),
                  child: ListView(
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
                      // 区切り線
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 回答 領域
                Expanded(
                  flex: 1,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const QuizChoices(),
                      const GoNextButton(),
                      const AnswerResult(),
                    ],
                  ),
                ),
              ],
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
