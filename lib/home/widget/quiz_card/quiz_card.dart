import 'package:flutter/material.dart';
import 'package:nlwabril/core/app_colors.dart';
import 'package:nlwabril/core/app_images.dart';
import 'package:nlwabril/core/app_text_styles.dart';
import 'package:nlwabril/shared/models/quiz_model.dart';
import 'package:nlwabril/shared/widgets/progress_indicator.dart';

class QuizCard extends StatelessWidget {
  final QuizModel quiz;
  final VoidCallback onTap;

  final imgConfig = {
    "blocks": AppImages.blocks,
    "laptop": AppImages.laptop,
    "hierarchy": AppImages.hierarchy,
    "data": AppImages.data,
  };

  String get appImage => imgConfig[quiz.imagem] ?? AppImages.blocks;

  QuizCard({Key? key, required this.quiz, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(appImage),
            ),
            Text(
              quiz.title,
              style: AppTextStyles.heading15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "${quiz.questionAnswered}/${quiz.questions.length}",
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(
                      value: quiz.questionAnswered / quiz.questions.length),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
