import 'package:flutter/material.dart';
import 'package:nlwabril/core/app_text_styles.dart';
import 'package:nlwabril/shared/widgets/progress_indicator.dart';

class QuestionIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Questao 4", style: AppTextStyles.body),
              Text("de 10", style: AppTextStyles.body),
            ],
          ),
          SizedBox(height: 20),
          ProgressIndicatorWidget(value: 0.7),
        ],
      ),
    );
  }
}
