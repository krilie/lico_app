import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lico_app/splash_page/splash.dart';
import 'package:oktoast/oktoast.dart';

import 'HomePage.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        routes: <String, WidgetBuilder>{
          //配置路径
          '/HomePage': (BuildContext context) => HomePage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SplashPage());
  }
}

// flutter packages pub run build_runner build
