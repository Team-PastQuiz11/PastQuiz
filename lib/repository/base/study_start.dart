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
    final unSolvedIndex = List.generate(yearMap[yearsList[i]]!.length, (index) {
      return '${yearsList[i]}$index';
    });
    allList.addAll(unSolvedIndex);
  }
  unsolvedQuestions = allList;

  final unSolvedtr = unsolvedQuestions.join(',');
  goNextQ();

  if (isRemain) {
    await StudyStateModel.deleteState();
  }

  await StudyStateModel.createState(
    nowQuestion: popQuestion,
    unSolved: unSolvedtr,
  );
}
