class BaseModel{

  BaseModel({
    required this.popQuestion,
    required this.drawerScreenManager,
    required this.isEdit,
    // required this.quizAnswer
  });

  String popQuestion;
  int drawerScreenManager;
  bool isEdit;
  // String quizAnswer;

}

List<String> unsolvedQuestions = [];