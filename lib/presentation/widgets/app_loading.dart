import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class AppLoading {
  BuildContext context;

  AppLoading(this.context);

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Center(
        child: CupertinoPopupSurface(
          child: Material(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Platform.isIOS ? CupertinoActivityIndicator(radius: 12) :
                  Container(
                    width: 24,
                    height: 24,
                      child: CircularProgressIndicator()
                  ),
                  SizedBox(height: 8),
                  AppText(title: "Mohon tunggu")
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}