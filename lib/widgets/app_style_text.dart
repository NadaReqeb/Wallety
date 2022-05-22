import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle extends StatelessWidget {
  late String name;
  late FontWeight fontWeight;
  late double fontSize;
  late Color color;
  late int count;
  late double letterSpacing;
  late double wordSpacing;
  late int maxLines;
  late TextOverflow overflow;
  TextAlign textAlign;

  AppTextStyle({
    this.color = Colors.black,
    required this.name,
    required this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.count = 20,
    this.letterSpacing = 1,
    this.wordSpacing = 1,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    return Text(

      name,
      maxLines: count,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis,
          fontSize: fontSize,
          fontFamily: 'Almarai',
          height: 1.5
      ),
    );
  }
}
