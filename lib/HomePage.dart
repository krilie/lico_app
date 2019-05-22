import 'package:flutter/material.dart';
import 'dart:core';
import 'package:lico_app/network/http_api.dart';

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
          onPressed: () {
            var token = api.instance.userLogin("aa", "bb");
            token.then((o){
              print(o);
            });
          },
          child: Text("ok"),
        ),
        constraints: new BoxConstraints.expand(),
      )
    );
  }
}
