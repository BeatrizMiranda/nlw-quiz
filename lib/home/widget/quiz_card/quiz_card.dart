import 'package:flutter/material.dart';
import 'package:nlwabril/core/app_colors.dart';
import 'package:nlwabril/core/app_images.dart';
import 'package:nlwabril/core/app_text_styles.dart';
import 'package:nlwabril/shared/widgets/progress_indicator.dart';

class QuizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Image.asset(AppImages.blocks),
          ),
          Text(
            'Gerenciamento de estado',
            style: AppTextStyles.heading15,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "3 de 10",
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 2,
                child: ProgressIndicatorWidget(value: 0.3),
              )
            ],
          )
        ],
      ),
    );
  }
}
