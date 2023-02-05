import 'package:flutter/material.dart';

import 'package:past_questions/View/try_questions/test_choice/result_detail.dart';

enum QuestionPattern {
  savedata,
  nomal,
  correct_per,
  after_pass,
  unCorrect_q,
}

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("result"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                ResultSquareFrame(
                  title: "回答数",
                  amount: 15,
                ),
                ResultSquareFrame(
                  title: "正解数",
                  amount: 5,
                ),
                ResultSquareFrame(
                  title: "正解率",
                  amount: 22,
                ),
                ResultSquareFrame(
                  title: "一覧",
                ),
              ],
            ),
            const ResultCategoryFrame(
              height: 20,
              name: "分野",
              question_amount: "回答数",
              correct_amount: "正解数",
              solo_cor_per: "個人正解",
              all_cor_per: "全体正解",
              topic: true,
            ),
            //co
            ResultCategoryFrame(
              height: 50,
              name: "ストラテジ",
              question_amount: 14.toString(),
              correct_amount: 7.toString(),
              solo_cor_per: 50.toString(),
              all_cor_per: 66.toString(),
              bgColor: Colors.lightBlue.shade100,
              topic: false,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        ResultCategoryFrame(
                          height: 20,
                          name: "四則",
                          question_amount: 7.toString(),
                          correct_amount: 5.toString(),
                          solo_cor_per: 60.toString(),
                          all_cor_per: 33.toString(),
                          topic: false,
                        ),
                      ],
                    );
                  }),
            ),
            //co
            ResultCategoryFrame(
              height: 50,
              name: "マネジメント",
              question_amount: 14.toString(),
              correct_amount: 7.toString(),
              solo_cor_per: 50.toString(),
              all_cor_per: 66.toString(),
              bgColor: Colors.lightBlue.shade100,
              topic: false,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        ResultCategoryFrame(
                          height: 20,
                          name: "四則",
                          question_amount: 7.toString(),
                          correct_amount: 5.toString(),
                          solo_cor_per: 60.toString(),
                          all_cor_per: 33.toString(),
                          topic: false,
                        ),
                      ],
                    );
                  }),
            ),
            //co
            ResultCategoryFrame(
              height: 50,
              name: "テクノロジ",
              question_amount: 14.toString(),
              correct_amount: 7.toString(),
              solo_cor_per: 50.toString(),
              all_cor_per: 66.toString(),
              bgColor: Colors.lightBlue.shade100,
              topic: false,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        ResultCategoryFrame(
                          height: 20,
                          name: "四則",
                          question_amount: 7.toString(),
                          correct_amount: 5.toString(),
                          solo_cor_per: 60.toString(),
                          all_cor_per: 33.toString(),
                          topic: false,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultSquareFrame extends StatefulWidget {
  const ResultSquareFrame({required this.title, this.amount, super.key});
  final String title;
  final int? amount;

  @override
  State<ResultSquareFrame> createState() => _ResultSquareFrameState();
}

class _ResultSquareFrameState extends State<ResultSquareFrame> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: GestureDetector(
          onTap: () {
            widget.title == "一覧"
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultDetail()),
                  )
                : Container();
          },
          child: Container(
            height: 100,
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.title),
                widget.amount != null
                    ? Text(
                        widget.amount.toString(),
                        style: TextStyle(fontSize: 30),
                      )
                    : Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

class ResultCategoryFrame extends StatefulWidget {
  const ResultCategoryFrame(
      {required this.height,
      required this.name,
      required this.question_amount,
      required this.correct_amount,
      required this.solo_cor_per,
      required this.all_cor_per,
      this.bgColor,
      required this.topic,
      super.key});

  final double height;
  final String name;
  final String question_amount;
  final String correct_amount;
  final String solo_cor_per;
  final String all_cor_per;
  final Color? bgColor;
  final bool topic;

  @override
  State<ResultCategoryFrame> createState() => _ResultCategoryFrameState();
}

class _ResultCategoryFrameState extends State<ResultCategoryFrame> {
  @override
  Widget build(BuildContext context) {
    final TextStyle basefont =
        TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.bold);
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: widget.bgColor),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(widget.name),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(widget.question_amount.toString()),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(widget.correct_amount),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: widget.solo_cor_per,
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    widget.topic
                        ? const TextSpan(
                            text: '',
                          )
                        : const TextSpan(
                            text: '%',
                            style: TextStyle(fontSize: 10),
                          )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: widget.all_cor_per,
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    widget.topic
                        ? TextSpan(
                            text: '',
                          )
                        : TextSpan(
                            text: '%',
                            style: TextStyle(fontSize: 10),
                          )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
