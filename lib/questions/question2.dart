//1つのdartファイルに過去問データを全部書くテイで
class Question2 {
  int year; //年度　<-[竹内] 静的(変化しない)部分　class管理でオッケー
  int year_question; //年度の？問目　<-[竹内]  静的
  String season; //春or秋　<-[竹内]  静的
  String category; //3大カテゴリ　<-[竹内]  静的
  String category_Detail; //3大カテゴリ内の詳細 ストラテジorマネジメントorテクノロジ <-[竹内]  静的

  String q_statement; //問題文　<-[竹内]  静的
  String q_imagePath; //問題図　<-[竹内]  静的

  //[竹内] 選択肢に関しては静的な部分が大半だと考える。keywordだけ不明
  List<Chioce> choices ;

  Question2({
    required this.year,
    required this.year_question,
    required this.season,
    required this.category,
    required this.category_Detail,
    required this.q_statement,
    this.q_imagePath = "",
    //選択肢の表記??
    required this.choices,
  });
}

class Chioce{

  String answer_text;
  String answer_image;
  String keyword;
  bool judge;

  Chioce({
    required this.answer_text,
    this.answer_image = "",
    this.keyword = "",
    required this.judge
  });
}

// final List<Question2> quizListTest = [
//   Question2(
//     year: year, 
//     year_question: year_question, 
//     season: season, 
//     category: category, 
//     category_Detail: category_Detail, 
//     q_statement: q_statement, 
//     choices: [
//       {},
//     ])
// ]
