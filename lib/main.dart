import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:past_questions/View/Chat/chatScreen.dart';
import 'package:past_questions/View/Chat/editPage.dart';
import 'package:past_questions/View/Router/drawerRouter.dart';
import 'package:past_questions/View/tryquestions/tryquestions.dart';
import 'package:past_questions/questions/2022/questions_2022.dart';
import 'package:past_questions/service/database/studystateDB.dart';
import 'package:past_questions/service/database/userRecordsDB.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(context){
    return MaterialApp(
      home: DrawerRouter()
    );
  }
}

