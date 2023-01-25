import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../try_questions/try_questions.dart';

class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseP = ref.watch(baseProvider);
    final popQuestion = baseP.model.popQuestion;
    final drawerScreenManager = baseP.model.drawerScreenManager;

    var isNumber = (popQuestion == '' || popQuestion == '終了') ? false : true;
    var popYear = isNumber ? popQuestion.substring(0, 4) : null;
    var popIndex = isNumber ? popQuestion.substring(4) : null;
    var questionNumber = isNumber ? int.parse(popIndex!) + 1 : null;

    var title = !(isNumber && drawerScreenManager == 0)
        ? 'タイトル'
        : '$popYear年 $questionNumber問';

    return AppBar(
      title: Text(title),
      leading: (popQuestion != '' && drawerScreenManager == 0)
          ? IconButton(
              onPressed: () {
                baseP.popQuestionChange('');
              },
              icon: const Icon(Icons.backspace_rounded),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
