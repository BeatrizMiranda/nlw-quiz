import 'package:flutter/material.dart';
import 'package:nlwabril/challenge/widget/answer/answer_widget.dart';
import 'package:nlwabril/core/app_text_styles.dart';
import 'package:nlwabril/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({Key? key, required this.question, required this.onChange})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSellected = -1;

  anwers(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: anwers(i),
              isSelected: indexSellected == i,
              disabled: indexSellected != -1,
              onTap: () {
                setState(() {
                  widget.onChange();
                  indexSellected = i;
                });
              },
            ),
        ],
      ),
    );
  }
}
