import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../try_questions/try_questions.dart';

class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final baseP = ref.watch(baseProvider);
    final popQuestion = baseP.model.popQuestion;
    final drawerScreenManager = baseP.model.drawerScreenManager;

    bool isNumber = (popQuestion == '' || popQuestion == '終了') ? false : true;
    String? popYear = isNumber ? popQuestion.substring(0, 4) : null;
    String? popIndex = isNumber ? popQuestion.substring(4) : null;
    int? questionNumber = isNumber ? int.parse(popIndex!) + 1 : null;

    String title = !(isNumber && drawerScreenManager == 0)
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
