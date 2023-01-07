import '2021/questions_2021.dart';
import '2022/questions_2022.dart';

class Question {
  Question({
    required this.title,
    required this.text,
    required this.choices,
    required this.answer,
    this.imagePath = '',
  });
  String title;
  String text;
  List<String> choices;
  int answer;
  String imagePath;
}

final Map<String, List<Question>> yearMap = {
  '2022': questions_2022,
  '2021': questions_2021
};

List<String> yearsKeys = yearMap.keys.toList();
