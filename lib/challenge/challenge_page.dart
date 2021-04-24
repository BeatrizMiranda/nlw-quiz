import 'package:flutter/material.dart';
import 'package:nlwabril/challenge/widget/nextButton/next_button.dart';
import 'package:nlwabril/challenge/widget/question_indicator/question_indicator.dart';
import 'package:nlwabril/challenge/widget/quiz/quiz_widget.dart';
import 'package:nlwabril/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              QuestionIndicator(),
            ],
          ),
        ),
      ),
      body: QuizWidget(question: widget.questions[0]),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NextButton.grey(label: "Pular", onTap: () {}),
              SizedBox(width: 10),
              NextButton.green(label: "Enviar", onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
