import 'package:flutter/material.dart';

class QuizDevider extends StatelessWidget {
  const QuizDevider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF333333),
            width: 1,
          ),
        ),
      ),
    );
  }
}
