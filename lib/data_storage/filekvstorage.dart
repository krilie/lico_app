import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'kvstorager.dart';

class fileKvStorage implements kvStorager {
  // 工厂模式
  factory fileKvStorage() => _getInstance();

  static fileKvStorage get instance => _getInstance();
  static fileKvStorage _instance = new fileKvStorage._internal();

  static fileKvStorage _getInstance() {
    return _instance;
  }

  fileKvStorage._internal() {}

  String basePath = "kvjson.json";

  @override
  void close() {
    // TODO: implement close
  }

  @override
  Future<String> getClientAccToken() {
    return getValue(Keys.clientAccToken);
  }

  @override
  Future<String> getServiceEndPoint() {
    return getValue(Keys.serviceEndPoint);
  }

  @override
  Future<String> getUserId() {
    return getValue(Keys.userId);
  }

  @override
  Future<String> getUserNickName() {
    return getValue(Keys.userNickName);
  }

  @override
  Future<String> getUserToken() {
    return getValue(Keys.userToken);
  }

  @override
  void setClientAccToken(String v) {
    setValue(Keys.clientAccToken, v);
  }

  @override
  void setServiceEndPoint(String hostPort) {
    setValue(Keys.serviceEndPoint, hostPort);
  }

  @override
  void setUserInfo(String nickName, userId, token) {
    setValue(Keys.userNickName, nickName);
    setValue(Keys.userId, userId);
    setValue(Keys.userToken, token);
  }

  void setValue(String key, String value) async {
    // 打开文件
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    File file = File('$documentsPath/$basePath');
    if (!file.existsSync()) {
      file = await file.create(recursive: true);
    }
    // 写入文件
    String notes = await file.readAsString();
    if(notes == null || notes.length == 0){
      var kvs = Map();
      kvs[key] = value;
      var jsonkv = jsonEncode(kvs);
      file.writeAsString(jsonkv);
    }else{
      var kvs = jsonDecode(notes);
      kvs[key] = value;
      var jsonkv = jsonEncode(kvs);
      file.writeAsString(jsonkv);
    }
    // 关闭文件
  }

  Future<String> getValue(String key) async {
    // 打开文件
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    File file = File('$documentsPath/$basePath');
    if (!file.existsSync()) {
      file = await file.create(recursive: true);
    }
    // 写入文件
    String notes = await file.readAsString();
    if(notes == null || notes.length == 0){
      return "";
    }else{
      var kvs = jsonDecode(notes);
      return kvs[key];
    }
    // 关闭文件
  }

}