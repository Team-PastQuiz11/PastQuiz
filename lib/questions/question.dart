import 'package:flutter/material.dart';
import 'package:past_questions/questions/2021/questions_2021.dart';
import 'package:past_questions/questions/2022/questions_2022.dart';

// class Question {
//   String title;
//   String text;
//   List<String> chioces;
//   int answer;
//   String imagePath;

//   Question(
//       {required this.title,
//       required this.text,
//       required this.chioces,
//       required this.answer,
//       this.imagePath = ""});
// }

// final Map<String, List<Question>> yearMap = {
//   "2022": Questions_2022,
//   "2021": Questions_2021
// };

// List<String> yearsKeys = yearMap.keys.toList();

//1つのdartファイルで全部書くテイで
class Question {
  int year; //年度
  int year_qustion; //年度の？問目
  String season; //春or秋
  String category; //3大カテゴリ
  String category_Detail; //3大カテゴリ内の詳細
  bool afterCheck; //後で確認したい問題

  String question_statement; //問題文
  String question_imagePath; //問題図

  double correct_per; //問題の歴代全体正解率
  int retry_count; //この問題何回目？

  List<Map<String, dynamic>> choices = [
    //アの選択
    {
      'answer_text': '',
      'answer_image': '',
      'keyword': '',
      'judge': '',
    },
    //イの選択
    {
      'answer_text': '',
      'answer_image': '',
      'keyword': '',
      'judge': '',
    },
    //ウの選択
    {
      'answer_text': '',
      'answer_image': '',
      'keyword': '',
      'judge': '',
    },
    //エの選択
    {
      'answer_text': '',
      'answer_image': '',
      'keyword': '',
      'judge': '',
    },
    //どう書けばいいのか...
    //内容：選択肢　{選択肢(図を使う場合null)、図(nullの可能性)、紐づく用語(nullの可能性もある)、正解or不正解}
  ];

  Question({
    required this.year,
    required this.year_qustion,
    required this.season,
    required this.category,
    required this.category_Detail,
    this.afterCheck = false,
    required this.question_statement,
    this.question_imagePath = "",
    //選択肢の表記??
    required this.choices,
    required this.correct_per,
    required this.retry_count,
  });
}
