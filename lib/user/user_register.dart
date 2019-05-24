import 'package:flutter/material.dart';
import 'package:lico_app/network/http_api.dart';

class UserRegisterScreen extends StatefulWidget {
  @override
  _UserRegisterScreen createState() => _UserRegisterScreen();
}

class _UserRegisterScreen extends State<UserRegisterScreen> {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  String loginName; // 用
  String password; // 密码

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("注册")),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: registerKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: new InputDecoration(labelText: "请输入用户名"),
                      onSaved: (value) {
                        loginName = value;
                      },
                      onFieldSubmitted: (value) {},
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "请输入密码"),
                      obscureText: true,
                      validator: (value) {
                        return value.length < 6 ? "长度不够6位" : null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 340,
              height: 42,
              child: RaisedButton(
                onPressed: () {
                  // 注册
                  var registerForm = registerKey.currentState;
                  if (registerForm.validate()) {
                    registerForm.save();
                    api.instance.userRegister(loginName, password).then((o) {
                      debugPrint("register ok ${o.code} ${o.message}");
                    });
                  }
                },
                child: Text(
                  '注册',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            )
          ],
        ));
  }
}
