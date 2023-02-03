import 'package:flutter/material.dart';

class QuizQuestionInfo extends StatelessWidget {
  const QuizQuestionInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.all(1.0),
                child: const Text('演習回数:88回目')),
            Container(
                margin: const EdgeInsets.all(1.0),
                child: const Text('全体正解率:100%')),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(1.0),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.0),
              decoration: BoxDecoration(
                color: Colors.pink[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text('アルゴリズムとプログラミング'),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              margin: const EdgeInsets.all(1.0),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.0),
              decoration: BoxDecoration(
                color: Colors.purple[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text('テクノロジー'),
            ),
          ],
        ),
      ],
    );
  }
}
