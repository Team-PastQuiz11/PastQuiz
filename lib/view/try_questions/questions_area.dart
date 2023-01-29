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

    const paddingScreen = 16.0;
    const marginAreaBottom = 8.0;

    // for Debug
    const isDebug = false;
    // ignore: dead_code
    const colorArea = isDebug ? Colors.white : Colors.transparent;
    // ignore: dead_code
    final colorBackground = isDebug ? Colors.grey[100] : Colors.amber[25];

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
            color: colorBackground,
            child: Padding(
              padding: const EdgeInsets.all(paddingScreen),
              child: Column(
                children: <Widget>[
                  // 問題情報 領域
                  Container(
                    color: colorArea,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(1.0),
                                child: const Text('この問題何回目: ...')),
                            Container(
                                margin: const EdgeInsets.all(1.0),
                                child: const Text('全体正解率:100%')),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(1.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 1.0),
                              decoration: BoxDecoration(
                                color: Colors.pink[300],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text('アルゴリズムとプログラミング'),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Container(
                              margin: const EdgeInsets.all(1.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 1.0),
                              decoration: BoxDecoration(
                                color: Colors.purple[300],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text('テクノロジー'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: marginAreaBottom),
                  // 区切り線
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF333333),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: marginAreaBottom),
                  // 問題 領域 (最大:画面上部50%)
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: colorArea,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  fit: BoxFit.fitWidth,
                                ),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: marginAreaBottom),
                  // 区切り線
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF333333),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: marginAreaBottom),
                  // 回答 領域
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: colorArea,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const QuizChoices(),
                          const GoNextButton(),
                          const AnswerResult(),
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
