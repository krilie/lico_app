import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'kvstorager.dart';
import 'package:json_annotation/json_annotation.dart';

class fileSqliteHelper implements kvStorager {
  // 工厂模式
  factory fileSqliteHelper() => _getInstance();

  static fileSqliteHelper get instance => _getInstance();
  static fileSqliteHelper _instance = new fileSqliteHelper._internal();

  static fileSqliteHelper _getInstance() {
    return _instance;
  }

  fileSqliteHelper._internal() {}

  String basePath = "kvjson.json";

  @override
  void close() {
    // TODO: implement close
  }

  @override
  Future<String> getClientAccToken() {
    // TODO: implement getClientAccToken
    return null;
  }

  @override
  Future<String> getServiceEndPoint() {
    // TODO: implement getHostPort
    return null;
  }

  @override
  Future<String> getUserId() {
    // TODO: implement getUserId
    return null;
  }

  @override
  Future<String> getUserNickName() {
    // TODO: implement getUserNickName
    return null;
  }

  @override
  Future<String> getUserToken() {
    // TODO: implement getUserToken
    return null;
  }

  @override
  void setClientAccToken(String v) {
    // TODO: implement setClientAccToken
  }

  @override
  void setServiceEndPoint(String hostPort) {
    // TODO: implement setHostPort
  }

  @override
  void setUserInfo(String nickName, userId, token) {
    // TODO: implement setUserInfo
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
}