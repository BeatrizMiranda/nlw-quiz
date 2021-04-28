import 'package:flutter/material.dart';
import 'package:nlwabril/core/app_colors.dart';
import 'package:nlwabril/core/app_text_styles.dart';
import 'package:nlwabril/home/widget/chart/chart_widget.dart';

class ScoreCard extends StatelessWidget {
  final double percent;

  const ScoreCard({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.all(24),
        height: 136,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ChartWidget(valuePercent: percent),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vamos Começar', style: AppTextStyles.heading),
                    Text('Complete os desafios e avance em conhecimento',
                        style: AppTextStyles.body),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
