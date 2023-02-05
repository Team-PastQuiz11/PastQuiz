import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResultDetail extends StatefulWidget {
  const ResultDetail({super.key});

  @override
  State<ResultDetail> createState() => _ResultDetailState();
}

class _ResultDetailState extends State<ResultDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('詳細'),
        ),
        body: Column(
          children: [
            QuestionDetailFrame(
              all_per: '全体%',
              answer: '解答',
              category: 'カテゴリ',
              q_No: 'No.',
              title: '問題概要',
              bgColor: Colors.orange.shade600,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return QuestionDetailFrame(
                      all_per: '56',
                      answer: '〇',
                      category: 'テクノロジ',
                      q_No: '001',
                      title: 'HDDに関する問題',
                      bgColor: Colors.orange.shade100,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class QuestionDetailFrame extends StatefulWidget {
  const QuestionDetailFrame(
      {required this.answer,
      required this.q_No,
      required this.category,
      required this.title,
      required this.all_per,
      required this.bgColor,
      super.key});

  final String answer;
  final String q_No;
  final String category;
  final String title;
  final String all_per;
  final Color bgColor;

  @override
  State<QuestionDetailFrame> createState() => _QuestionDetailFrameState();
}

class _QuestionDetailFrameState extends State<QuestionDetailFrame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.bgColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(widget.answer),
                ),
              ),
            ),
            Expanded(child: Center(child: Text("Q${widget.q_No}"))),
            Expanded(
              flex: 3,
              child: Chip(
                label: Text(
                  widget.category,
                  style: TextStyle(fontSize: 8),
                ),
                elevation: 1,
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(wordSpacing: 4),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: widget.all_per,
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      // widget.topic
                      //     ? const TextSpan(
                      //         text: '',
                      //       )
                      //     :
                      const TextSpan(
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
      ),
    );
  }
}
