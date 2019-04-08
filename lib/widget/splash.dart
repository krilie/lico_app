import 'dart:core';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  SplashScreen(this.imageStr);

  final String imageStr;

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(this.imageStr));
  }
}
