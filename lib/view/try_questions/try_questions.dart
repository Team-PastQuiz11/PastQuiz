import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/base/base_repository.dart';
import '../../repository/question/question_repository.dart';
import 'choose_years.dart';
import 'questions_area.dart';

final baseProvider = ChangeNotifierProvider.autoDispose(
  (ref) => BaseRepository(),
);

final questionProvider = ChangeNotifierProvider.autoDispose(
  (ref) => QuestionProvider(),
);

class TryQuestions extends ConsumerWidget {
  TryQuestions({super.key});

  final Map<String, Widget> childMap = {
    '': const ChooseYears(),
    '終了': const Center(
      child: Text('おめでとう'),
    ),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseP = ref.watch(baseProvider);
    return childMap[baseP.model.popQuestion] ??
        QuestionArea(
          key: GlobalKey(),
        );
  }
}
