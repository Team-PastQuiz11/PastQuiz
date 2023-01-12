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

//1つのdartファイルに過去問データを全部書くテイで
class Question {
  int year; //年度　<-[竹内] 静的(変化しない)部分　class管理でオッケー
  int year_question; //年度の？問目　<-[竹内]  静的
  String season; //春or秋　<-[竹内]  静的
  String category; //3大カテゴリ　<-[竹内]  静的
  String category_Detail; //3大カテゴリ内の詳細 ストラテジorマネジメントorテクノロジ <-[竹内]  静的
  bool afterCheck; //後で確認したい問題 <-[竹内] 　ローカル管理?(もし他のユーザーと共有したいのであればオンライン検討)

  String q_statement; //問題文　<-[竹内]  静的
  String q_imagePath; //問題図　<-[竹内]  静的

  //　↓　ここはあってもなくてもいい（負荷が掛かるならいらない）
  int all_q_count; //全ユーザーの回答数　<-[竹内]  firebase
  int all_q_correct; //全ユーザーの正解数　<-[竹内]  firebase
  double correct_per; //問題の歴代全体ユーザー正解率　＝全体の正解数/全体の回答数　<-[竹内]  firebase
  int retry_count; //この問題何回目？　<-[竹内]  よくわかってない。静的？
  //　↑

  //[竹内] 選択肢に関しては静的な部分が大半だと考える。keywordだけ不明
  List<Map<String, dynamic>> choices = [ 
    //アの選択
    {
      'answer_text': '', //選択肢 アプリ上表記文
      'answer_image': '', //選択肢 図（図がある場合は基本、文はなし）
      'keyword': '', //この選択肢にかかわる単語
      'judge': '', //正解or不正解　
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
    required this.year_question,
    required this.season,
    required this.category,
    required this.category_Detail,
    this.afterCheck = false,
    required this.q_statement,
    this.q_imagePath = "",
    //選択肢の表記??
    required this.choices,
    required this.correct_per,
    required this.retry_count,
    required this.all_q_correct,
    required this.all_q_count,
  });
}
