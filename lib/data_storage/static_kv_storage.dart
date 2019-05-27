
import 'kvstorager.dart';

class StaticKvStorage implements kvStorager{

  String accToken;
  String userToken;
  String hostPort;
  String userId;
  String userNickName;

  @override
  void close() {
    // TODO: implement close
  }

  @override
  Future<String> getClientAccToken() async {
    return "123";
  }

  @override
  Future<String> getHostPort() async {
    return "123";
  }

  @override
  Future<String> getUserId()async {
    return "123";
  }

  @override
  Future<String> getUserNickName()async {
    return "123";
  }

  @override
  Future<String> getUserToken()async {
    return "123";
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

  @override
  Future<String> getServiceEndPoint() {
    // TODO: implement getServiceEndPoint
    return null;
  }

  @override
  void setServiceEndPoint(String endpoint) {
    // TODO: implement setServiceEndPoint
  }

}