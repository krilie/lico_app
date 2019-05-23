import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:lico_app/network/http_api.dart';

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
  void initState() {
    api.instance.dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        if (options.headers == null)
          options.headers = {
            HeaderClientAccToken: "123",
          };
        else
          options.headers[HeaderClientAccToken] = "234";
      },
      onError: (DioError e) {
        var msg = StdRet.fromJson(e.response.data);
        final snackBar = new SnackBar(
            content: new Text(
                e.response.statusCode.toString() + msg.code + msg.message));
        Scaffold.of(context).showSnackBar(snackBar);
        return e.response;
      },
      onResponse: (Response e) {},
    ));
  }
}
