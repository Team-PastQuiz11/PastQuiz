import 'dart:math';

import 'package:flutter/material.dart';
import 'package:past_questions/model/base_model.dart';
import 'package:past_questions/questions/question.dart';
import 'package:past_questions/repository/base/study_start.dart';
import 'package:past_questions/service/database/study_state_db.dart';

class BaseRepository extends ChangeNotifier {
  BaseModel model = BaseModel(
    popQuestion: '',
    drawerScreenManager: 0,
    isEdit: false,
    // quizAnswer: ""
  );

  void popQuestionChange(String popQuestionStr) {
    model.popQuestion = popQuestionStr;
    notifyListeners();
  }

  void drawerScreenChange(int screenKey) {
    model.drawerScreenManager = screenKey;
    notifyListeners();
  }

  void editStateChange(bool bool) {
    model.isEdit = bool;
    notifyListeners();
  }

  int uselessStateId = -999;

  void determineYear({required String year, required bool isRemain}) async {
    await studyStart(
      isRemain: isRemain,
      popQuestion: model.popQuestion,
      yearsList: [year],
      goNextQ: () {
        goNextQ(stateId: uselessStateId, isStart: true);
      },
    );

    notifyListeners();
  }

  void goNextQ({required int stateId, bool isStart = false}) {
    model.popQuestion =
        unsolvedQuestions[Random().nextInt(unsolvedQuestions.length)];
    unsolvedQuestions.remove(model.popQuestion);

    // String unsolved16 = c.hex.encode(unsolvedNumbers);
    String unSolvedStr = unsolvedQuestions.join(',');

    if (!isStart) {
      StudyStateModel.updateState(
        stateId: stateId,
        nowQuestion: model.popQuestion,
        unSolved: unSolvedStr,
      );
    }

    notifyListeners();
  }

  void reStart({required String popQuestion, required String unSolvedStr}) {
    model.popQuestion = popQuestion;
    unsolvedQuestions = unSolvedStr.split(',');
    notifyListeners();
  }

  void goEnd() {
    StudyStateModel.deleteState();
    model.popQuestion = '終了';

    notifyListeners();
  }

  Future<void> goAllCourse({required bool isRemain}) async {
    await studyStart(
      isRemain: isRemain,
      popQuestion: model.popQuestion,
      yearsList: yearsKeys,
      goNextQ: () {
        goNextQ(stateId: uselessStateId, isStart: true);
      },
    );

    notifyListeners();
  }
}
