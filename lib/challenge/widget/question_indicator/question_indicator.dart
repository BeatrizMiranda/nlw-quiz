import 'package:flutter/material.dart';
import 'package:nlwabril/core/app_text_styles.dart';
import 'package:nlwabril/shared/widgets/progress_indicator.dart';

class QuestionIndicator extends StatelessWidget {
  final int currentPage;
  final int amountPages;

  const QuestionIndicator({
    Key? key,
    required this.currentPage,
    required this.amountPages,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Questao $currentPage", style: AppTextStyles.body),
              Text("de $amountPages", style: AppTextStyles.body),
            ],
          ),
          SizedBox(height: 20),
          ProgressIndicatorWidget(value: currentPage / amountPages),
        ],
      ),
    );
  }
}
