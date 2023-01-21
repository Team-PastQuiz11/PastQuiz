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

    // ignore: unused_local_variable
    final questionP = ref.watch(questionProvider);
    final drawerScreenManager = baseP.model.drawerScreenManager;

    return Scaffold(
      appBar: const CustomAppbar(),
      body: SafeArea(child: screenMap[drawerScreenManager]!),
      endDrawer: const CustomDrawer(),
      floatingActionButton: const CustomFloatButton(),
    );
  }
}
