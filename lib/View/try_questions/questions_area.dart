import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../questions/question.dart';
import 'parts/answer_result.dart';
import 'parts/go_next_button.dart';
import 'parts/quiz_choices.dart';
import 'try_questions.dart';

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
                    Text(popQuestion.text),
                    if (popQuestion.imagePath != '')
                      Image.asset(
                        popQuestion.imagePath,
                        width: MediaQuery.of(context).size.width * 0.95,
                        fit: BoxFit.fitWidth,
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
                    const AnswerResult(),
                  ],
                ),
              ),
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
