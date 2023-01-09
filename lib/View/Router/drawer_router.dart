import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../chat/chat_screen.dart';
import '../try_questions/try_questions.dart';
import 'appbar/custom_appbar.dart';
import 'custom_drawer.dart';
import 'custom_float_button.dart';

class DrawerRouter extends ConsumerStatefulWidget {
  const DrawerRouter({super.key});

  @override
  ConsumerState<DrawerRouter> createState() => DrawerRouterState();
}

class DrawerRouterState extends ConsumerState<DrawerRouter> {
  Map<int, Widget> screenMap = {
    0: TryQuestions(),
    1: const ChatScreen(),
  };

  @override
  Widget build(context) {
    final baseP = ref.watch(baseProvider);

    final questionP = ref.watch(questionProvider);
    final popQuestion = baseP.model.popQuestion;
    final drawerScreenManager = baseP.model.drawerScreenManager;

    bool isNumber = (popQuestion == '' || popQuestion == '終了') ? false : true;
    int? popNum = isNumber ? int.parse(popQuestion) : null;
    String? popYear = isNumber ? popQuestion.substring(0, 4) : null;
    String? popIndex = isNumber ? popQuestion.substring(4) : null;
    int? questionNumber = isNumber ? int.parse(popIndex!) + 1 : null;

    String title = !(isNumber && drawerScreenManager == 0)
        ? 'タイトル'
        : '$popYear年 $questionNumber問';

    return Scaffold(
      appBar: const CustomAppbar(),
      body: SafeArea(child: screenMap[drawerScreenManager]!),
      endDrawer: const CustomDrawer(),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
