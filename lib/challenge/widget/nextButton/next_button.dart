import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nlwabril/core/app_colors.dart';

class NextButton extends StatelessWidget {
  final String label;
  final bool isEnabled;
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
    this.isEnabled = true,
  });

  NextButton.green(
      {required String label, required VoidCallback onTap, bool? isEnabled})
      : this.bgColor = AppColors.darkGreen,
        this.onTap = onTap,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.darkGreen,
        this.isEnabled = isEnabled ?? true,
        this.label = label;

  NextButton.grey(
      {required String label, required VoidCallback onTap, bool? isEnabled})
      : this.bgColor = AppColors.white,
        this.onTap = onTap,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.isEnabled = isEnabled ?? true,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        child: IgnorePointer(
          ignoring: !isEnabled,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: isEnabled
                  ? MaterialStateProperty.all(
                      bgColor,
                    )
                  : MaterialStateProperty.all(
                      Color(0xFFd4d4d4),
                    ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              side: MaterialStateProperty.all(
                BorderSide(
                  color: isEnabled ? borderColor : Color(0xFFd4d4d4),
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
      ),
    );
  }
}
