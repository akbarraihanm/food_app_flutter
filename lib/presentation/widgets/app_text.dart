import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {

  String title;
  Color color;
  TextDecoration decoration;
  double fontSize;
  double fontHeight;
  TextAlign align;
  TextOverflow overflow = TextOverflow.fade;
  FontWeight fontWeight;
  FontStyle fontStyle;
  int maxLine;

  AppText(
      {this.title,
        this.color,
        this.decoration,
        this.fontSize,
        this.fontHeight,
        this.align,
        this.overflow,
        this.fontWeight,
        this.fontStyle,
        this.maxLine
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: fontSize ?? 14,
          height: fontHeight,
          decoration: decoration,
          color: color,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal
      ),
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
    );
  }
}
