import 'dart:math';
import 'package:convert/convert.dart' as c;
import 'package:flutter/material.dart';
import 'package:past_questions/model/basemodel.dart';
import 'package:past_questions/questions/question.dart';
import 'package:past_questions/repository/base/studyStart.dart';
import 'package:past_questions/service/database/studystateDB.dart';

class BaseRepository extends ChangeNotifier{
  BaseModel model = BaseModel(
    popQuestion: "",
    drawerScreenManager: 0,
    isEdit: false,
    // quizAnswer: ""
  );

  

  void popQuestionChange(String popQuestionStr){
    model.popQuestion = popQuestionStr;
    notifyListeners();
  }

  void drawerScreenChange(int screenKey){
    model.drawerScreenManager = screenKey;
    notifyListeners();
  }
  
  void editStateChange(bool bool){
    model.isEdit = bool;
    notifyListeners();
  }



  int uselessStateId = -999;

  void DetermineYear({
    required String year,
    required bool isRemain
    }) async {
    await studyStart(
      isRemain: isRemain, 
      popQuestion: model.popQuestion, 
      yearsList: [year], 
      goNextQ: (){
        GoNextQ(stateId: uselessStateId,isStart: true);
      }
      );
    

    notifyListeners();
  }

  void GoNextQ({
    required int stateId,
    bool isStart = false
  }){
    model.popQuestion = unsolvedQuestions[Random().nextInt(unsolvedQuestions.length)];
    unsolvedQuestions.remove(model.popQuestion);
    
    // String unsolveds16 = c.hex.encode(unsolvedNumbers);
    String unsolvedsStr = unsolvedQuestions.join(",");

    if(!isStart){
      StudyStateModel.updateState(
        stateId: stateId,
        nowQuestion: model.popQuestion,
        unsolveds: unsolvedsStr
        );
    }

    notifyListeners();
  }

  void reStart({
    required String popQuestion, 
    required String unsolvedsStr
    }){

    model.popQuestion = popQuestion;
    unsolvedQuestions = unsolvedsStr.split(',');
    notifyListeners();
  }

  void GoEnd(){
    StudyStateModel.deleteState();
    model.popQuestion = "終了";
    
    notifyListeners();
  }

  Future<void> GoAllCource({
    required bool isRemain
    }) async {

    await studyStart(
      isRemain: isRemain, 
      popQuestion: model.popQuestion, 
      yearsList: yearsKeys, 
      goNextQ: (){
        GoNextQ(stateId: uselessStateId,isStart: true);
      }
      );

    notifyListeners();
  }
}

