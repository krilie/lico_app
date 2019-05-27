import 'dart:core';
import 'package:lico_app/data_storage/kvstorager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KvStorage implements kvStorager {
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
    prefs.setString(Keys.userNickName, nickName);
    prefs.setString(Keys.userId, userId);
    prefs.setString(Keys.userToken, token);
  }
  @override
  Future<String> getUserNickName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Keys.userNickName);
  }

  @override
  Future<String> getClientAccToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Keys.clientAccToken);
  }

  @override
  void setClientAccToken(String v) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Keys.clientAccToken, v);
  }

  @override
  Future<String> getUserToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Keys.userToken);
  }
  @override
  Future<String> getUserId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Keys.userId);
  }

  @override
  void close() {
    SharedPreferences.getInstance().then((onValue){
//      onValue.commit();
    });

  }

  @override
  Future<String> getHostPort() {
    // TODO: implement getHostPort
    return null;
  }

  @override
  void setHostPort(String hostPort) {
    // TODO: implement setHostPort
  }

}

