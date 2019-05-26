
abstract class kvstorager{
  void setUserInfo(String nickName,userId,token);
  Future<String> getUserNickName();
  Future<String> getClientAccToken();
  void setClientAccToken(String v);
  Future<String> getUserToken();
  Future<String> getUserId();
  void close();
}