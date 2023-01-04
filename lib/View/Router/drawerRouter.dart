import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/Chat/chatScreen.dart';
import 'package:past_questions/View/Chat/editPage.dart';
import 'package:past_questions/View/Router/appBar/customAppbar.dart';
import 'package:past_questions/View/Router/customDrawer.dart';
import 'package:past_questions/View/Router/customFloatButton.dart';
import 'package:past_questions/View/tryquestions/tryquestions.dart';

class DrawerRouter extends ConsumerStatefulWidget{

  const DrawerRouter({
    Key? key
  }):super(
    key: key
  );

  @override
  ConsumerState<DrawerRouter> createState() => DrawerRouterState();
}

class DrawerRouterState extends ConsumerState<DrawerRouter>{

  Map<int,Widget> screenMap = {
    0: TryQuestions(),
    1: ChatScreen(),
  };

  @override
  Widget build(context){
    final baseP = ref.watch(baseProvider);

    final questionP = ref.watch(questionProvider);
    final popQuestion = baseP.model.popQuestion;
    final drawerScreenManager = baseP.model.drawerScreenManager;

    bool isNumber = (popQuestion == "" || popQuestion == "終了") ? false : true;
    int? popNum = isNumber ? int.parse(popQuestion) : null;
    String? popYear = isNumber ? popQuestion.substring(0,4) :null;
    String? popIndex = isNumber ? popQuestion.substring(4) : null;
    int? questionNumber = isNumber ? int.parse(popIndex!) + 1 :null;

    String title = !(isNumber && drawerScreenManager == 0) ? "タイトル" : "$popYear年 $questionNumber問";


    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(child: screenMap[drawerScreenManager]!),
      endDrawer: CustomDrawer(),
      floatingActionButton: CustomFloatButton()

    );
  }


}