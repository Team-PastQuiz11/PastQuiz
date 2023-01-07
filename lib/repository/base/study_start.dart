import '../../model/base_model.dart';
import '../../questions/question.dart';
import '../../service/database/study_state_db.dart';

Future<void> studyStart({
  required bool isRemain,
  required String popQuestion,
  required List<String> yearsList,
  required void Function() goNextQ,
}) async {
  final allList = <String>[];
  for (var i = 0; i < yearsList.length; i++) {
    final unsolvedsIndex =
        List<String>.generate(yearMap[yearsList[i]]!.length, (index) {
      return "${yearsList[i]}$index";
    });
    allList.addAll(unsolvedsIndex);
  }
  unsolvedsQuestions = allList;

  final unsolvedsStr = unsolvedsQuestions.join(',');
  goNextQ();

  if (isRemain) {
    await StudyStateModel.deleteState();
  }

  await StudyStateModel.createState(
    nowquestion: popQuestion,
    unsolveds: unsolvedsStr,
  );
}
