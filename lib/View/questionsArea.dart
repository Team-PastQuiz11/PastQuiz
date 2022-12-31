import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/tryquestions.dart';
import 'package:past_questions/model/model.dart';
import 'package:past_questions/questions/question.dart';
import 'package:past_questions/service/database/userRecordsDB.dart';

class QuestionArea extends ConsumerStatefulWidget{

  const QuestionArea({
    Key? key,
  }):super(
    key: key
  );

  

  @override
  ConsumerState<QuestionArea> createState()=> QuestionAreaState();

}

class QuestionAreaState extends ConsumerState<QuestionArea>{

  int choiceAnswer = 0;
  bool isFirstLoad = false;
  List<Map<String, dynamic>> specificRecord = [];


  Future<void> preImageLoad(String imagePath) async{
    if(imagePath != ""){
      await precacheImage(AssetImage(imagePath), context);
    }
    setState(() {
      isFirstLoad = true;
    });
  }

  void getRecordHere(int year,int nowQuestion) async{
    specificRecord = await UserRecordsModel.getSpecificRecord(year, nowQuestion);
  }

  @override
  Widget build(context){

    final provider = ref.watch(myProvider);
    final popQuestion = yearMap[provider.model.year]![provider.model.popNum];

    return FutureBuilder(
      future: (!isFirstLoad && popQuestion.imagePath != "")? preImageLoad(popQuestion.imagePath) : null,
      builder:(context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }

        getRecordHere(provider.model.year, provider.model.popNum);
        print(specificRecord);
        
        return Stack(
          children: [
            Column(
              children: [
                Text(popQuestion.text),

                if(popQuestion.imagePath != "")
                  Image.asset(
                    popQuestion.imagePath,
                    width: MediaQuery.of(context).size.width * 0.95,
                    fit: BoxFit.fitWidth,
                  ),
                
                for(var i=0;i<4; i++)...[
                  ElevatedButton(
                    onPressed: choiceAnswer == 0 ? (){
                      if(i == popQuestion.answer){
                        setState(() {
                          choiceAnswer = 1;
                        });
                      }else{
                        setState(() {
                          choiceAnswer = 2;
                        });
                      }

                      specificRecord.length > 0 ?
                      UserRecordsModel.updateRecord(
                        provider.model.year, 
                        provider.model.popNum, 
                        i == popQuestion.answer ? 0 : 1
                        ) :
                      UserRecordsModel.createRecord(
                        provider.model.year, 
                        provider.model.popNum, 
                        i == popQuestion.answer ? 0 : 1
                        );
                    } : null, 
                    child: Text(popQuestion.chioces[i])
                    )
                ],

                if(choiceAnswer != 0)
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        choiceAnswer = 0;
                      });

                      if(unsolvedNumbers.length >0){
                        provider.GoNextQ();
                      }else{
                        provider.GoEnd();
                      }
                      
                    }, 
                    child: Text("次へ")
                    )
              ],
            ),

            if(choiceAnswer != 0)
              Center(
                child: Text(
                  choiceAnswer == 1  ? "正解" : "ハズレ"
                ),
              )
          ],
        );
      },
    );


  }

}
