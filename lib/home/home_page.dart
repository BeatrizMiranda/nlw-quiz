import 'package:nlwabril/home/widget/appbar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:nlwabril/home/widget/levelButton/level_button.dart';
import 'package:nlwabril/home/widget/quiz_card/quiz_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Column(
          children: [
            levelButons(),
            SizedBox(
              height: 24,
            ),
            quizCards()
          ],
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

  Widget quizCards() {
    return Expanded(
      child: GridView.count(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        crossAxisCount: 2,
        children: [
          QuizCard(),
          QuizCard(),
          QuizCard(),
          QuizCard(),
        ],
      ),
    );
  }
}
