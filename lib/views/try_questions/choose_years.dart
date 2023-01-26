import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../questions/question.dart';
import '../../service/database/study_state_db.dart';
import '../../service/database/user_records_db.dart';
import 'try_questions.dart';

class ChooseYears extends ConsumerStatefulWidget {
  const ChooseYears({super.key});

  @override
  ConsumerState<ChooseYears> createState() => ChooseYearsState();
}

class ChooseYearsState extends ConsumerState<ChooseYears> {
  final nowQuestionColumn = StudyStateModel.nowQuestionColumn;
  final unSolvedColumn = StudyStateModel.unSolvedColumn;

  List<Map<String, dynamic>> state = [];
  List<Map<String, dynamic>> records = [];
  List<Map<String, dynamic>> recordsTrue = [];
  bool isLoading = true;

  Future<void> _refreshJournals() async {
    final stateData = await StudyStateModel.getState();
    final recordsData = await UserRecordsModel.getRecordsList();
    final recordsTrueData = await UserRecordsModel.getRecordsListTrue();

    setState(() {
      state = stateData;
      records = recordsData;
      recordsTrue = recordsTrueData;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    final baseP = ref.watch(baseProvider);

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final isRemain = state.isNotEmpty ? true : false;

    return Center(
      child: Column(
        children: [
          for (var i = 0; i < yearMap.length; i++) ...[
            ElevatedButton(
              onPressed: () {
                baseP.determineYear(year: yearsKeys[i], isRemain: isRemain);
              },
              child: Text(yearsKeys[i].toString()),
            )
          ],
          ElevatedButton(
            onPressed: () {
              baseP.goAllCourse(isRemain: isRemain);
            },
            child: const Text('全部解く'),
          ),
          if (isRemain)
            ElevatedButton(
              onPressed: () {
                baseP.reStart(
                  popQuestion: state[0][nowQuestionColumn],
                  unSolvedStr: state[0][unSolvedColumn],
                );
              },
              child: const Text('続きから'),
            ),
          ElevatedButton(
            onPressed: () async {
              await UserRecordsModel.deleteAllRecord();
              await _refreshJournals();
            },
            child: const Text('全記録削除'),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(records.length.toString()),
              Text(
                '${(recordsTrue.length / records.length * 100).toStringAsFixed(1)}%',
              ),
              Text(recordsTrue.length.toString())
            ],
          )
        ],
      ),
    );
  }
}
