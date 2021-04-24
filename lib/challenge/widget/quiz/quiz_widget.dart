import 'package:flutter/material.dart';
import 'package:nlwabril/challenge/widget/awnser/awnser_widget.dart';
import 'package:nlwabril/core/app_text_styles.dart';
import 'package:nlwabril/shared/models/question_model.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;

  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          ...question.answers
              .map(
                (e) => AwnserWidget(
                  title: e.title,
                  isRight: e.isRight,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
