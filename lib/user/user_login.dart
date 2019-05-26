import 'package:flutter/material.dart';
import 'package:lico_app/network/http_api.dart';
import 'package:lico_app/user/user_register.dart';

class UserLoginScreen extends StatefulWidget {
  @override
  _UserLoginScreen createState() => _UserLoginScreen();
}

class _UserLoginScreen extends State<UserLoginScreen> {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  String loginName; // 用
  String password; // 密码

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("登录")),
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
                      validator: (value) {},
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
                  // 登录
                  var registerForm = registerKey.currentState;
                  if (registerForm.validate()) {
                    registerForm.save();
                    api.instance.userLogin(loginName, password).then((o) {
                      debugPrint("login ok ${o.token}");
                    });
                  }
                },
                child: Text(
                  '登录',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(
              width: 340,
              height: 42,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return UserRegisterScreen();
                    }));
                  },
                  child: Center(
                    child: Text(
                      '注册',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.deepOrange,
                          fontStyle: FontStyle.italic,
                          textBaseline: TextBaseline.alphabetic,
                          decoration:TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dotted
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}
