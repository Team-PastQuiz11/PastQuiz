import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/tryquestions/tryquestions.dart';

class AnswerResult extends ConsumerWidget{

  @override
  Widget build(context,ref){
    final questionP = ref.watch(questionProvider);
    final quizAnswer = questionP.model.quizAnswer;

    return Center(
      child: quizAnswer != "" ? 
        Text(quizAnswer) :
        null,
    );
  }
}