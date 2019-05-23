import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:lico_app/network/http_api.dart';
import 'package:oktoast/oktoast.dart';

import 'network/http_api_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('应用'),
        ),
        body: Builder(builder: (BuildContext context) {
          return FlatButton(
              onPressed: () {
                var token = api.instance.userLogin("aa", "bb");
                token.then((o) {
                  debugPrint(o.toString());
                });
              },
              child: Text("ok"));
        }));
  }

  @override
  void initState() {}
}
