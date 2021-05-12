import 'package:flutter/material.dart';

import 'app_text.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {

  double width;
  String title;
  Color color;
  Color textColor;
  Widget child;
  Function() onTap;

  AppButton(
      {this.width,
        this.title,
        this.color,
        this.textColor,
        this.child,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: width ?? double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: child ?? AppText(
            title: title,
            fontWeight: FontWeight.w500,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
