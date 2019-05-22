import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class KvStorage {

  static void setUserInfo(String nickName,userId,token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_nick_name", nickName);
    prefs.setString("user_id", userId);
    prefs.setString("user_token", token);
  }
  static Future<String> getUserNickName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_nick_name");
  }

  static Future<String> getClientAccToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("client_acc_token");
  }

  static void setClientAccToken(String v) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("client_acc_token", v);
  }

  static Future<String> getUserToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_token");
  }
  static Future<String> getUserId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_id");
  }

}

