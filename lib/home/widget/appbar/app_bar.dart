import 'package:nlwabril/core/app_colors.dart';
import 'package:nlwabril/core/app_gradients.dart';
import 'package:nlwabril/core/app_text_styles.dart';
import 'package:nlwabril/home/widget/ScoreCard/score_card.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 180,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Olá ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                                text: "Bea Miranda",
                                style: AppTextStyles.titleBold)
                          ],
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.darkPurple,
                            width: 3,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://avatars.githubusercontent.com/u/28959326?v=4'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(alignment: Alignment(0.0, 1.5), child: ScoreCard())
              ],
            ),
          ),
        );
}
