import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lico_app/data_storage/kvstorage.dart';
import 'package:lico_app/network/http_api.dart';
import 'package:lico_app/network/http_api_model.dart';
import 'package:lico_app/user/user_register.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:lico_app/HomePage.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '登录',
      home: _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  //手机号的控制器
  TextEditingController phoneController = TextEditingController();

  //密码的控制器
  TextEditingController passController = TextEditingController();

  // 光标跳转的输入框对象
  FocusNode secondTextFieldNode = FocusNode();

  // 加载进度条
  Container loadingDialog;

  // 显示加载进度条
  showLoadingDialog() {
    setState(() {
      loadingDialog = Container(
          constraints: BoxConstraints.expand(),
          color: Color(0x80000000),
          child: Center(
            child: CircularProgressIndicator(),
          ));
    });
  }

  // 隐藏加载进度条
  hideLoadingDialog() {
    setState(() {
      loadingDialog = Container();
    });
  }

  void login() async {
    if (phoneController.text.length != 11) {
      showToast("请输入11位手机号码");
    } else if (passController.text.length == 0) {
      showToast("密码不能为空");
    } else {
      showLoadingDialog();
      // 检查登录状态

      try {
        UserLoginRet ret = await api.instance
            .userLogin(phoneController.text, passController.text);
        KvStorage.setUserInfo(null, null, ret.token);
        //跳转主页 且销毁当前页面
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => new HomePage()),
            (Route<dynamic> rout) => false);
      } catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
//        showToast("网络连接错误");
      } finally {
        hideLoadingDialog();
      }
//      phoneController.clear();
//      passController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    hideLoadingDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment(0.0, -1.0),
        children: [
          // 背景图
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: new Image.asset(
              "images/flower2.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0,0.0, 0.0),
            // 滚动布局，输入法键盘打开时输入框可以上移
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                // 输入框卡片
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Stack(
                    alignment: Alignment(0.0, -1.0),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              // 控制器用于获取输入的内容
                              controller: phoneController,
                              // 键盘格式
                              keyboardType: TextInputType.number,
                              // 光标颜色
                              cursorColor: Colors.white,
                              // 键盘动作按钮，如“下一步”
                              textInputAction: TextInputAction.next,
                              // 键盘动作按钮点击之后执行的代码：
                              //光标切换到指定的输入框
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(secondTextFieldNode),
                              // 文本样式
                              style: new TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  // 输入框文本周边的距离
                                  contentPadding: EdgeInsets.all(10.0),
                                  // 输入框边框
                                  border: InputBorder.none,
                                  // 提示文字
                                  hintText: '请输入账户名',
                                  // 提示文本颜色
                                  hintStyle:
                                      new TextStyle(color: Colors.white54)),
                              autofocus: false, // 是否自动获取焦点
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            TextField(
                              controller: passController,
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.white,
                              focusNode: secondTextFieldNode,
                              onEditingComplete: () {
                                login();
                              },
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              style: new TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  border: InputBorder.none,
                                  hintText: '请输入密码',
                                  hintStyle:
                                      new TextStyle(color: Colors.white54)),
                              autofocus: false,
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ), // 登录按钮
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          login();
                        },
                        color: Color(0xffFE9A18),
                        child: Text(
                          "登录",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          // 调到注册界面
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return UserRegisterScreen();
                          }));
                        },
                        color: Color(0xffFE9A18),
                        child: Text(
                          "注册",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
          loadingDialog
        ],
      ),
    );
  }
}
