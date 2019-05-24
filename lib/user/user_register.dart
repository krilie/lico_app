import 'package:flutter/material.dart';

class UserRegisterScreen extends StatefulWidget {
  @override
  _UserRegisterScreen createState() => _UserRegisterScreen();
}

class _UserRegisterScreen extends State<UserRegisterScreen> {
  TextEditingController userLoginNameController = TextEditingController(); // 用
  TextEditingController passwordController = TextEditingController(); // 密码
  FocusNode secondTextFieldNode = FocusNode(); // 光标

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("注册")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          widthFactor: 180,
          heightFactor: 80,
          child: Text("center"),
        ),
      ),
    );
  }
}
