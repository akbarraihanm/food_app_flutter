import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  void push(BuildContext context, {Widget child}) {
    Navigator.push(context, Platform.isIOS ?
    CupertinoPageRoute(builder: (ctx) => child) : MaterialPageRoute(builder: (_) => child));
  }

  void pushAndBack(BuildContext context, {Widget child, Function(dynamic value) returnCallback}) {
    Navigator.push(context, Platform.isIOS ? CupertinoPageRoute(builder: (ctx) =>
    child) : MaterialPageRoute(builder: (_) => child)).then(returnCallback);
  }

  void pushReplacement(BuildContext context, {Widget child}) {
    Navigator.pushReplacement(context, Platform.isIOS ?
    CupertinoPageRoute(builder: (ctx) => child) : MaterialPageRoute(builder: (_) => child));
  }
}