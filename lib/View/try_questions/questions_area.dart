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
      future: (!isFirstLoad && popQuestion.imagePath != "")
          ? preImageLoad(popQuestion.imagePath)
          : null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Stack(
          children: [
            Column(
              children: [
                Text(popQuestion.text),
                if (popQuestion.imagePath != "")
                  Image.asset(
                    popQuestion.imagePath,
                    width: MediaQuery.of(context).size.width * 0.95,
                    fit: BoxFit.fitWidth,
                  ),
                const QuizChoices(),
                const GoNextButton()
              ],
            ),
            const AnswerResult()
          ],
        );
      },
    );
  }

  Future<void> preImageLoad(String imagePath) async {
    if (imagePath != "") {
      await precacheImage(AssetImage(imagePath), context);
    }

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
