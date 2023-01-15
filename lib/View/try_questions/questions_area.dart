import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/questions/question.dart';

import 'parts/answer_result.dart';
import 'parts/go_next_button.dart';
import 'parts/quiz_choices.dart';
import 'try_questions.dart';

class QuestionArea extends ConsumerStatefulWidget {
  const QuestionArea({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<QuestionArea> createState() => QuestionAreaState();
}

class QuestionAreaState extends ConsumerState<QuestionArea> {
  bool isFirstLoad = false;
  List<Map<String, dynamic>> specificRecord = [];

  @override
  Widget build(context) {
    final baseP = ref.watch(baseProvider);
    final questionP = ref.watch(questionProvider);

    final String quizAnswer = questionP.model.quizAnswer;

    final popQuestionStr = baseP.model.popQuestion;
    String popYear = popQuestionStr.substring(0, 4);
    int popIndex = int.parse(popQuestionStr.substring(4));
    final popQuestion = yearMap[popYear]![popIndex];

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
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    // imagePathがでない場合、'問題文と画像'を表示する実装
                    Visibility(
                      visible: popQuestion.imagePath != '',
                      child: Column(
                        children: [
                          Text(popQuestion.text),
                          Image.asset(
                            popQuestion.imagePath,
                            width: MediaQuery.of(context).size.width * 0.95,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    ),
                    // imagePathが空の場合、'問題文のみ'を表示する実装
                    Visibility(
                      visible: popQuestion.imagePath == '',
                      child: Text(popQuestion.text),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const QuizChoices(),
                    const GoNextButton(),
                    const AnswerResult()
                  ],
                ),
              )
            ],
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
