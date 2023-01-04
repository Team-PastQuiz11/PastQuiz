import 'package:flutter/material.dart';
import 'package:past_questions/model/quetsionModel.dart';

class QuestionProvider extends ChangeNotifier{

  QuestionModel model = QuestionModel(
    quizAnswer: "",
    );

  void quizAnswerChange(String str){
    model.quizAnswer = str;
    notifyListeners();
  }
}