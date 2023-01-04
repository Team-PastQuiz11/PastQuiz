import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/tryquestions/tryquestions.dart';
import 'package:past_questions/model/basemodel.dart';
import 'package:past_questions/service/database/studystateDB.dart';

class GoNextButton extends ConsumerWidget{

  @override
  Widget build(context,ref){
    final baseP = ref.watch(baseProvider);
    final questionP = ref.watch(questionProvider);
    final quizAnswer = questionP.model.quizAnswer;

    if(quizAnswer == ""){
      return SizedBox.shrink();
    }

    return ElevatedButton(
      onPressed: () async {
        questionP.quizAnswerChange("");

        if(unsolvedQuestions.length >0) {
          List<Map<String,dynamic>> state = await StudyStateModel.getState();
          baseP.GoNextQ(stateId: state[0]["id"]);
        }else{
          baseP.GoEnd();
        }
        
      }, 
      child: Text("次へ")
      );
  }
}