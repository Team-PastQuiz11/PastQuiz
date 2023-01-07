import 'dart:math';

import 'package:flutter/material.dart';

import '../../model/base_model.dart';
import '../../questions/question.dart';
import '../../service/database/study_state_db.dart';
import 'study_start.dart';

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

  Future<void> determineYear({
    required String year,
    required bool isRemain,
  }) async {
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
        unsolvedsQuestions[Random().nextInt(unsolvedsQuestions.length)];
    unsolvedsQuestions.remove(model.popQuestion);

    // String unsolveds16 = c.hex.encode(unsolvedsNumbers);
    final unsolvedsStr = unsolvedsQuestions.join(',');

    if (!isStart) {
      StudyStateModel.updateState(
        stateId: stateId,
        nowquestion: model.popQuestion,
        unsolveds: unsolvedsStr,
      );
    }

    notifyListeners();
  }

  void reStart({required String popQuestion, required String unsolvedsStr}) {
    model.popQuestion = popQuestion;
    unsolvedsQuestions = unsolvedsStr.split(',');
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
