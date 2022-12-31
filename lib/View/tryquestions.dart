import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:past_questions/View/chooseyears.dart';
import 'package:past_questions/View/questionsArea.dart';
import 'package:past_questions/main.dart';
import 'package:past_questions/questions/question.dart';
import 'package:past_questions/repository/repository.dart';

final myProvider = ChangeNotifierProvider.autoDispose(
  (ref) => Repository()
);

class TryQuestions extends ConsumerWidget{

  @override
  Widget build(context,ref){
    final provider = ref.watch(myProvider);

    if(provider.model.year == -1){
      return Center(child: Text("おめでとう"),);
    }

    if(provider.model.year == 0){
      return ChooseYears();
    }

    return QuestionArea(key: new GlobalKey(),);
  }
}

