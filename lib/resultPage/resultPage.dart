import 'package:flutter/material.dart';
import 'package:nlwabril/challenge/widget/nextButton/next_button.dart';
import 'package:nlwabril/core/app_colors.dart';
import 'package:nlwabril/core/app_images.dart';
import 'package:nlwabril/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenght;
  final int correctAwnsers;

  const ResultPage(
      {Key? key,
      required this.title,
      required this.lenght,
      required this.correctAwnsers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 110),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(AppImages.trophy),
                Text("Parabéns!", style: AppTextStyles.heading40),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(text: "\n$title", style: AppTextStyles.bodyBold),
                      TextSpan(
                          text: "\ncom $correctAwnsers de $lenght acertos",
                          style: AppTextStyles.body),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButton.purple(
                          label: 'Compartilhar',
                          onTap: () {
                            Share.share(
                                'DevQuiz: Olha o que eu consegui, $title - com $correctAwnsers de $lenght acertos!');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: NextButton(
                        bgColor: Colors.transparent,
                        fontColor: AppColors.grey,
                        borderColor: Colors.transparent,
                        label: "Voltar ao Início",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
