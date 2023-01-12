//以下は竹内のご提案です。
class Question2 {
  int year; //年度　<-[竹内] 静的(変化しない)部分　class管理でオッケー
  int year_question; //年度の？問目　<-[竹内]  静的 
  int season; //春or秋　<-[竹内]  0-なし 1-春 2-秋　intで管理すれば問題作成時のミスが防ぎやすいと考えています
  int category; //3大カテゴリ　<-[竹内]  0 1 2
  int category_Detail; //3大カテゴリ内の詳細 ストラテジorマネジメントorテクノロジ <-[竹内]  静的　

  String q_statement; //問題文　<-[竹内]  静的
  String q_imagePath; //問題図　<-[竹内]  静的

  //[竹内] 選択肢に関しては静的な部分が大半だと考える。keywordはリンク？
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

//出力する際の条件分岐の例
const Map<int,String> seazonMap = {
  0:"",
  1:"春",
  2:"秋"
};

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


//実際に問題作成するときの想定
final List<Question2> quizListTest = [
  Question2(
    year: 2022, 
    year_question: 1, 
    season: 0, 
    category: 0, 
    category_Detail: 0, 
    q_statement:  """
著作権及び特許権に関する記述a~cのうち,適切なものだけを全て挙げたものはどれか。

a 偶然二つの同じようなものが生み出された場合， 発明に伴う特許権は両方に認められるが， 著作権は一方の著作者にだけ認められる。
b ソフトウェアの場合， 特許権も著作権もソースプログラムリストに対して認められる。
c 特許権の取得には出願と登録が必要だが， 著作権は出願や登録の必要はない。
    """, 
    choices: [
      Chioce(answer_text: "a,b",judge: false,),
      Chioce(answer_text: "b",  judge: false,),
      Chioce(answer_text: "b,c",judge: false,),
      Chioce(answer_text: "c",judge: true,),
    ]
  ),


];
