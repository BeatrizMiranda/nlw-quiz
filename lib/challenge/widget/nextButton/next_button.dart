import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nlwabril/core/app_colors.dart';

class NextButton extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  NextButton({
    required this.bgColor,
    required this.fontColor,
    required this.borderColor,
    required this.label,
    required this.onTap,
  });

  NextButton.green({required String label, required VoidCallback onTap})
      : this.bgColor = AppColors.darkGreen,
        this.onTap = onTap,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.darkGreen,
        this.label = label;

  NextButton.grey({required String label, required VoidCallback onTap})
      : this.bgColor = AppColors.white,
        this.onTap = onTap,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              bgColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            side: MaterialStateProperty.all(
              BorderSide(
                color: borderColor,
              ),
            ),
          ),
          onPressed: onTap,
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: fontColor,
            ),
          ),
        ),
      ),
    );
  }
}
