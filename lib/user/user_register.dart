import 'package:flutter/material.dart';

class UserRegisterScreen extends StatefulWidget {
  @override
  _UserRegisterScreen createState() => new _UserRegisterScreen();
}

class _UserRegisterScreen extends State<UserRegisterScreen> {
  TextEditingController userLoginNameController = TextEditingController(); // 用户名
  TextEditingController passwordController = TextEditingController(); // 密码
  FocusNode secondTextFieldNode = FocusNode(); // 光标

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("注册")),
      body: new Padding(
          padding: new EdgeInsets.all(8.0),
          child: Card(child: const Text('Hello World!')),
      ),
    );
  }

}