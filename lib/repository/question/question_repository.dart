import 'package:flutter/material.dart';

import '../../model/question_model.dart';

class QuestionProvider extends ChangeNotifier {
  QuestionModel model = QuestionModel(
    quizAnswer: '',
  );

  void quizAnswerChange(String str) {
    model.quizAnswer = str;
    notifyListeners();
  }
}
