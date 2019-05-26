import 'dart:core';
import 'package:lico_app/data_storage/kvstorager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KvStorage implements kvstorager {
  // 工厂模式
  factory KvStorage() => _getInstance();
  static KvStorage get instance => _getInstance();
  static KvStorage _instance = new KvStorage();
  static KvStorage _getInstance() {
    return _instance;
  }

  @override
  void setUserInfo(String nickName,userId,token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_nick_name", nickName);
    prefs.setString("user_id", userId);
    prefs.setString("user_token", token);
  }
  @override
  Future<String> getUserNickName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_nick_name");
  }

  @override
  Future<String> getClientAccToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("client_acc_token");
  }

  @override
  void setClientAccToken(String v) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("client_acc_token", v);
  }

  @override
  Future<String> getUserToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_token");
  }
  @override
  Future<String> getUserId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_id");
  }

  @override
  void close() {
    SharedPreferences.getInstance().then((onValue){
//      onValue.commit();
    });

  }

}

