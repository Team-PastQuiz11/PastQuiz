import 'package:flutter/material.dart';
import 'package:past_questions/questions/2021/questions_2021.dart';
import 'package:past_questions/questions/2022/questions_2022.dart';

class Question{
  String title;
  String text;
  List<String> chioces;
  int answer;
  String imagePath;

  Question({
    required this.title,
    required this.text,
    required this.chioces,
    required this.answer,
    this.imagePath = ""
  });
}

final Map<String,List<Question>> yearMap = {
  "2022": Questions_2022,
  "2021": Questions_2021
};

List<String> yearsKeys = yearMap.keys.toList();
