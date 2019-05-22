import 'package:flutter/material.dart';
import 'dart:core';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  new AppBar(
        title: new Text('应用'),
      ),
      body: ConstrainedBox(
        child: RaisedButton(
          onPressed: (){},
          child: Text("ok"),
        ),
        constraints: new BoxConstraints.expand(),
      )
    );
  }
}
