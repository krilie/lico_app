import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lico_app/HomePage.dart';
import 'package:lico_app/user/user_login.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPage createState() => new _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  bool isStartHomePage = false;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: Image.asset(
        "images/flower2.jpg",
        fit: BoxFit.fill,
      ),
      constraints: new BoxConstraints.expand(),
    );
  }

  //页面初始化状态的方法
  @override
  void initState() {
    super.initState();
    //设置倒计时三秒后执行跳转方法
    var duration = new Duration(seconds: 1);
    new Future.delayed(duration, () {
      //如果页面还未跳转过则跳转页面
      if (!isStartHomePage) {
        //跳转主页 且销毁当前页面
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => new LoginScreen()),
            (Route<dynamic> rout) => false);
        isStartHomePage = true;
      }
    });
  }
}
