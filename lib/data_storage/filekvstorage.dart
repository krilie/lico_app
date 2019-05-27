import 'kvstorager.dart';

class fileSqliteHelper implements kvStorager {
  // 工厂模式
  factory fileSqliteHelper() => _getInstance();

  static fileSqliteHelper get instance => _getInstance();
  static fileSqliteHelper _instance = new fileSqliteHelper._internal();

  static fileSqliteHelper _getInstance() {
    return _instance;
  }
  fileSqliteHelper._internal() {

  }

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
  Future<String> getHostPort() {
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
  void setHostPort(String hostPort) {
    // TODO: implement setHostPort
  }

  @override
  void setUserInfo(String nickName, userId, token) {
    // TODO: implement setUserInfo
  }


}