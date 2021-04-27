import 'package:flutter/material.dart';
import 'package:nlwabril/challenge/challenge_controller.dart';
import 'package:nlwabril/challenge/widget/nextButton/next_button.dart';
import 'package:nlwabril/challenge/widget/question_indicator/question_indicator.dart';
import 'package:nlwabril/challenge/widget/quiz/quiz_widget.dart';
import 'package:nlwabril/resultPage/resultPage.dart';
import 'package:nlwabril/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  bool isSendBtnEnabled = false;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void enableSend(bool value) {
    if (value) controller.qtdHits++;

    setState(() {
      isSendBtnEnabled = true;
    });
  }

  void nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 180),
      curve: Curves.linear,
    );
  }

  void goToResultPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          title: widget.title,
          lenght: widget.questions.length,
          correctAwnsers: controller.qtdHits,
        ),
      ),
    );
  }

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
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicator(
                  currentPage: value,
                  amountPages: widget.questions.length,
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(question: e, onSelected: enableSend),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ValueListenableBuilder(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: NextButton.grey(
                    label: "Pular",
                    onTap: nextPage,
                    isEnabled:
                        widget.questions.length != controller.currentPage,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: NextButton.green(
                    label: "Enviar",
                    onTap: widget.questions.length == value
                        ? goToResultPage
                        : nextPage,
                    isEnabled: isSendBtnEnabled,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
