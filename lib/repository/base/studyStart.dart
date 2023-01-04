import 'package:past_questions/model/basemodel.dart';
import 'package:past_questions/questions/question.dart';
import 'package:past_questions/service/database/studystateDB.dart';

Future<void> studyStart({
  required bool isRemain,
  required String popQuestion,
  required List<String> yearsList,
  required void Function() goNextQ,
}) async {
  List<String> allList = [];
  for(var i=0; i< yearsList.length; i++){
    List<String> unsolvedsIndex = await List.generate(yearMap[yearsList[i]]!.length, (index){
      return "${yearsList[i]}$index";
    });
    allList.addAll(unsolvedsIndex);
  }
  unsolvedQuestions = await allList;
  
  String unsolvedsStr = await unsolvedQuestions.join(",");
  goNextQ();

  if(isRemain){
    await StudyStateModel.deleteState();
  }

  await StudyStateModel.createState(
    nowQuestion: popQuestion, 
    unsolveds: unsolvedsStr
  );

}
