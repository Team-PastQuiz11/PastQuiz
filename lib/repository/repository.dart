import 'dart:math';
import 'package:convert/convert.dart' as c;
import 'package:flutter/material.dart';
import 'package:past_questions/model/model.dart';
import 'package:past_questions/questions/question.dart';
import 'package:past_questions/service/database/studystateDB.dart';

class Repository extends ChangeNotifier{
  Model model = Model(
    year: 0,
    popNum: -1
    );

  void yearChange(int year){
    model.year = year;
    notifyListeners();
  }



  void DetermineYear({
    required int year,required bool isRemain
    }) async {
    model.year = year;
    unsolvedNumbers = await List.generate(yearMap[year]!.length, (index) => index);
    
    String unsolveds16 = c.hex.encode(unsolvedNumbers);

    print("16$unsolveds16");
    List<int> reverse = await c.hex.decode(unsolveds16);
    print("reverse$reverse");

    GoNextQ(isStart: true);

    if(isRemain){
      StudyStateModel.updateState(year, model.popNum, unsolveds16);
    }else{
      StudyStateModel.createState(year,model.popNum,unsolveds16);
    }

    notifyListeners();
  }

  void GoNextQ({
    bool isStart = false
  }){
    print(model.popNum);
    model.popNum = unsolvedNumbers[Random().nextInt(unsolvedNumbers.length)];
    print(model.popNum);
    unsolvedNumbers.remove(model.popNum);
    
    String unsolveds16 = c.hex.encode(unsolvedNumbers);


    if(!isStart){
      StudyStateModel.updateState(model.year, model.popNum, unsolveds16);
    }

    notifyListeners();
  }

  void reStart(int year, int nowQuestion, String unsolves16){
    model.popNum = nowQuestion;

    List<int> list = c.hex.decode(unsolves16);

    unsolvedNumbers = List.generate(list.length, (i) => list[i]);
    model.year = year;
    notifyListeners();
  }

  void GoEnd(){
    StudyStateModel.deleteState();
    model.year = -1;
    
    notifyListeners();
  }

  void GoAllCource(){

  }
}

