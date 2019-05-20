import 'package:flutter/material.dart';
import 'package:lico_app/splash_page/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash(
          str: "images/flower2.jpg",
      ),
    );
  }
}
