import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/tryquestions/tryquestions.dart';
import 'package:past_questions/questions/question.dart';
import 'package:past_questions/service/database/studystateDB.dart';
import 'package:past_questions/service/database/userRecordsDB.dart';

class ChooseYears extends ConsumerStatefulWidget{

  @override
  ConsumerState<ChooseYears> createState() => ChooseYearsState();
}

class ChooseYearsState extends ConsumerState<ChooseYears>{

  final nowQuestiobColumn = StudyStateModel.nowquestionColumn;
  final unsolvedsColumn = StudyStateModel.unsolvedsColumn;

  List<Map<String,dynamic>> state = [];
  List<Map<String,dynamic>> records = [];
  List<Map<String,dynamic>> records_true = [];
  bool isLoading = true;

  void _refreshJournals()async{
    final statedata = await StudyStateModel.getState();
    final recordsdata = await UserRecordsModel.getRecordsList();
    final recordsTrueData = await UserRecordsModel.getRecordsList_true();

    setState(() {
      state = statedata;
      records = recordsdata;
      records_true = recordsTrueData;
      isLoading = false;
    });
  }

  @override
  void initState(){
    super.initState();
    _refreshJournals();
  }

  @override
  Widget build(context){
    final baseP = ref.watch(baseProvider);

    if(isLoading){
       return Center(child: CircularProgressIndicator(),);
    }


    bool isRemain = state.length > 0 ? true : false;

    return Center(
      child: Column(
          children: [
            for(var i=0; i<yearMap.length; i++)...[
              ElevatedButton(
                onPressed: (){
                  
                  baseP.DetermineYear(year: yearsKeys[i],isRemain: isRemain);
                }, 
                child: Text(yearsKeys[i].toString())
              )
            ],

            ElevatedButton(
              onPressed: (){
                baseP.GoAllCource(
                  isRemain: isRemain
                );
              }, 
              child: const Text("全部解く")
              ),

            if(isRemain)
              ElevatedButton(
                onPressed: (){
                  baseP.reStart(popQuestion: state[0][nowQuestiobColumn], unsolvedsStr: state[0][unsolvedsColumn]);
                }, 
               child: Text("続きから")
              ),

            ElevatedButton(
              onPressed: ()async{
                await UserRecordsModel.deleteAllRecord();
                _refreshJournals();
              }, 
              child: Text("全記録削除")
              ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(records.length.toString()),
              Text((records_true.length/records.length * 100).toStringAsFixed(1) + "%"),
              Text(records_true.length.toString())
            ],)
          ],
        ),
    );

  }
}