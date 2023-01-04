import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:past_questions/View/Router/customDrawer.dart';
import 'package:past_questions/View/tryquestions/chooseyears.dart';
import 'package:past_questions/View/tryquestions/questionsArea.dart';
import 'package:past_questions/main.dart';
import 'package:past_questions/questions/question.dart';
import 'package:past_questions/repository/base/baseRepository.dart';
import 'package:past_questions/repository/question/questionRepository.dart';

final baseProvider = ChangeNotifierProvider.autoDispose(
  (ref) => BaseRepository()
);

final questionProvider = ChangeNotifierProvider.autoDispose(
  (ref) => QuestionProvider()
);

class TryQuestions extends ConsumerWidget{

  final Map<String,Widget> childMap = {
    "": ChooseYears(),
    "終了": const Center(child: Text("おめでとう"),)
  };

  @override
  Widget build(context,ref){
    final baseP = ref.watch(baseProvider);
    return childMap[baseP.model.popQuestion] ?? 
      QuestionArea(
        key: GlobalKey(),
      );
  
  }
}

