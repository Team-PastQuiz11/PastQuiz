import 'package:flutter/material.dart';

class QuizDivider extends StatelessWidget {
  const QuizDivider({
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
