import 'package:flutter/material.dart';
import 'package:nlwabril/challenge/challenge_page.dart';
import 'package:nlwabril/core/app_colors.dart';
import 'package:nlwabril/core/app_text_styles.dart';
import 'package:nlwabril/home/home_controller.dart';
import 'package:nlwabril/home/home_state.dart';
import 'package:nlwabril/home/widget/appbar/app_bar.dart';
import 'package:nlwabril/home/widget/levelButton/level_button.dart';
import 'package:nlwabril/home/widget/quiz_card/quiz_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.error) {
      return Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error),
                SizedBox(height: 20),
                Text("Algo deu errado", style: AppTextStyles.heading),
              ],
            ),
          ),
        ),
      );
    }
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            children: [
              levelButons(),
              SizedBox(
                height: 24,
              ),
              quizCards(context, controller)
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        ),
      ),
    );
  }

  Widget levelButons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LevelButton(label: "Fácil"),
        LevelButton(label: "Médio"),
        LevelButton(label: "Difícil"),
        LevelButton(label: "Perito"),
      ],
    );
  }

  Widget quizCards(BuildContext context, controller) {
    return Expanded(
      child: GridView.count(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        crossAxisCount: 2,
        children: controller.quizzes!
            .map<Widget>(
              (quiz) => QuizCard(
                quiz: quiz,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChallengePage(questions: quiz.questions),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
