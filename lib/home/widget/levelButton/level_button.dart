import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlwabril/home/widget/levelButton/configuration.dart';

class LevelButton extends StatelessWidget {
  LevelButton({Key? key, required this.label})
      : assert(['Fácil', 'Médio', 'Difícil', 'Perito'].contains(label)),
        super(key: key);
  final String label;

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(
          BorderSide(color: borderColor),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
