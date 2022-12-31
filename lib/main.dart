import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/tryquestions.dart';
import 'package:past_questions/questions/2022/questions_2022.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}



class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(context){
    return MaterialApp(
      home: Router(),
    );
  }
}

class Router extends ConsumerStatefulWidget{

  @override
  ConsumerState<Router> createState() => RouterState();
}

class RouterState extends ConsumerState<Router>{

  int screenManager = 0;

  Map<int,Widget> screenMap = {
    0: TryQuestions(),
    1: Center(child: Text('チャットページの予定'),),
  };

  @override
  Widget build(context){
    final provider = ref.watch(myProvider);
    final year = provider.model.year;
    final popNum = provider.model.popNum;
    int questionNumber = popNum + 1;

    String title = year > 1900? "$year年 $questionNumber問目" : "タイトル";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: (year != 0 && screenManager == 0) ? 
          IconButton(
            onPressed: (){
              provider.yearChange(0);
            },
            icon: Icon(Icons.backspace_rounded)
            ) : null,
      ),
      body: SafeArea(child: screenMap[screenManager]!),
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.55,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("機能一覧"),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text("過去問"),
              onTap: () {
                setState(() {
                  screenManager = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("掲示板"),
              onTap: () {
                setState(() {
                  screenManager = 1;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

