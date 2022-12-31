import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/tryquestions.dart';
import 'package:past_questions/questions/question.dart';
import 'package:past_questions/service/database/studystateDB.dart';
import 'package:past_questions/service/database/userRecordsDB.dart';

class ChooseYears extends ConsumerStatefulWidget{

  @override
  ConsumerState<ChooseYears> createState() => ChooseYearsState();
}

class ChooseYearsState extends ConsumerState<ChooseYears>{

  final year_db = StudyStateModel.yearName;
  final nowQuestion_db = StudyStateModel.nowquestionName;
  final unsolves_db = StudyStateModel.unsolvesName;

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
    final provider = ref.watch(myProvider);

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
                  provider.DetermineYear(year: yearsKeys[i],isRemain: isRemain);
                }, 
                child: Text(yearsKeys[i].toString())
              )
            ],

            ElevatedButton(
              onPressed: (){
                
              }, 
              child: const Text("全部解く")
              ),

            if(isRemain)
              ElevatedButton(
                onPressed: (){
                  provider.reStart(state[0][year_db], state[0][nowQuestion_db], state[0][unsolves_db]);
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