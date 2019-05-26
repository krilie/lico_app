import 'package:flutter/material.dart';
import 'package:lico_app/network/http_api.dart';
import 'package:lico_app/user/user_register.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreen createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("设置")),
        body: Text("a")
    );
  }
}
