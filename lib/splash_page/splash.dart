import 'package:flutter/material.dart';
import 'dart:core';

class Splash extends StatelessWidget {
  final String str;

  const Splash({Key key, this.str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: Image.asset(
        str,
        fit: BoxFit.fill,
      ),
      constraints: new BoxConstraints.expand(),
    );
  }
}
