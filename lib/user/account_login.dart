import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '登录',
      home: new _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
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
      loadingDialog = new Container(
          constraints: BoxConstraints.expand(),
          color: Color(0x80000000),
          child: new Center(
            child: new CircularProgressIndicator(),
          ));
    });
  }

  // 隐藏加载进度条
  hideLoadingDialog() {
    setState(() {
      loadingDialog = new Container();
    });
  }

  void login() async {
    if (phoneController.text.length != 11) {
      showToast("请输入11位手机号码");
    } else if (passController.text.length == 0) {
      showToast("密码不能为空");
    } else {
      showLoadingDialog();
      Dio dio = new Dio();
      dio.options.baseUrl = ServerUrl.base;
      FormData formData = new FormData.from({
        "mobile": phoneController.text,
        "pwd": passController.text,
      });
      try {
        Response response = await dio.post(ServerUrl.token, data: formData);
        print(response.data.toString());
        if (response.data["status"] == 0) {
          String token = response.data["data"]["token"];
          print(token);
          if (token != null && token.trim() != "") {
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.setString("token", token);
            Navigator.of(context).pushReplacementNamed('/main');
          } else {
            showToast("登录失败)");
          }
        } else {
          showToast("账号或密码错误");
        }
      } catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        showToast("网络连接错误");
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
      body: new Stack(
        alignment: const Alignment(0.0, -1.0),
        children: [
          // 背景图
          new ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: new Image.asset(
              "assets/images/login_bg.png",
              fit: BoxFit.fill,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(38.0, 60.0, 38.0, 0.0),
            // 滚动布局，输入法键盘打开时输入框可以上移
            child: SingleChildScrollView(
                child: new Column(
              children: <Widget>[
                // 顶部logo
                new Center(
                  child: new Image.asset("assets/images/login_logo.png"),
                ),
                // 欢迎文字
                new Padding(
                  padding: new EdgeInsets.fromLTRB(0.0, 26.0, 0.0, 0.0),
                  child: new Center(
                    child: new Image.asset("assets/images/login_welcome.png"),
                  ),
                ),
                // 输入框卡片
                new Padding(
                  padding: new EdgeInsets.fromLTRB(0.0, 28.0, 0.0, 0.0),
                  child: new Stack(
                    alignment: const Alignment(0.0, -1.0),
                    children: <Widget>[
                      new Image.asset("assets/images/login_rect.png"),
                      new Padding(
                        padding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                        child: new Column(
                          children: <Widget>[
                            new TextField(
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
                            new Divider(
                              color: Colors.white,
                            ),
                            new TextField(
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
                            new Divider(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ), // 登录按钮
                new Padding(
                  padding: new EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                          child: new RaisedButton(
                        onPressed: () {
                          login();
                        },
                        color: new Color(0xffFE9A18),
                        child: new Text(
                          "登录",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                        ),
                      )),
                    ],
                  ),
                )
              ],
            )),
          ),
          loadingDialog
        ],
      ),
    );
  }
}
