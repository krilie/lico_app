
class Keys{
  static final userNickName = "user_nick_name";
  static final userId = "user_id";
  static final userToken = "user_token";
  static final clientAccToken = "client_acc_token";
}

abstract class kvStorager{
  void setUserInfo(String nickName,userId,token);
  Future<String> getUserNickName();
  Future<String> getClientAccToken();
  void setClientAccToken(String v);
  Future<String> getUserToken();
  Future<String> getUserId();
  void close();
}